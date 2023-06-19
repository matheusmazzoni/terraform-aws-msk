resource "aws_msk_configuration" "config" {
  count = var.create_cluster && var.create_msk_configuration ? 1 : 0

  kafka_versions = [var.kafka_version]
  name           = join("-", [var.cluster_name, replace(var.kafka_version, ".", "-")])
  description    = "Configuration for Amazon Managed Streaming for Kafka"

  server_properties = join("\n", [for k in keys(var.server_properties) : format("%s = %s", k, var.server_properties[k])])

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_msk_cluster" "default" {
  count = var.create_cluster ? 1 : 0

  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.enhanced_monitoring

  broker_node_group_info {
    instance_type   = var.broker_instance_type
    client_subnets  = var.subnet_ids
    security_groups = var.security_group_ids

    storage_info {
      ebs_storage_info {
        volume_size = var.broker_volume_size
      }
    }

    connectivity_info {
      public_access {
        type = var.public_access_enabled ? "SERVICE_PROVIDED_EIPS" : "DISABLED"
      }
    }
  }

  configuration_info {
    arn      = var.create_msk_configuration ? aws_msk_configuration.config[0].arn : var.msk_configuration_arn
    revision = var.create_msk_configuration ? aws_msk_configuration.config[0].latest_revision : var.msk_configuration_last_revision
  }

  encryption_info {
    encryption_in_transit {
      client_broker = var.client_broker
      in_cluster    = var.encryption_in_cluster
    }
    encryption_at_rest_kms_key_arn = var.encryption_at_rest_kms_key_arn
  }

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_cluster.html#client_authentication
  client_authentication {
    # Unauthenticated cannot be set to `false` without enabling any authentication mechanisms
    unauthenticated = var.client_allow_unauthenticated

    dynamic "tls" {
      for_each = var.client_tls_auth_enabled ? [1] : []
      content {
        certificate_authority_arns = var.certificate_authority_arns
      }
    }

    sasl {
      scram = var.client_sasl_scram_enabled
      iam   = var.client_sasl_iam_enabled
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = var.jmx_exporter_enabled
      }
      node_exporter {
        enabled_in_broker = var.node_exporter_enabled
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = var.cloudwatch_logs_enabled
        log_group = var.cloudwatch_logs_log_group
      }
      firehose {
        enabled         = var.firehose_logs_enabled
        delivery_stream = var.firehose_delivery_stream
      }
      s3 {
        enabled = var.s3_logs_enabled
        bucket  = var.s3_logs_bucket
        prefix  = var.s3_logs_prefix
      }
    }
  }

  tags = var.tags
}
