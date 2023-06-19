<!-- TOC -->

- [About](#about)
- [Documentation of Code Terraform](#documentation-of-code-terraform)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

<!-- TOC -->

# About

Terraform module to create AWS MSK.


# Documentation of Code Terraform



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_msk_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_cluster) | resource |
| [aws_msk_configuration.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_broker_instance_type"></a> [broker\_instance\_type](#input\_broker\_instance\_type) | (Required) Specify the instance type to use for the kafka brokersE.g., kafka.m5.large. (Pricing info) | `any` | n/a | yes |
| <a name="input_broker_volume_size"></a> [broker\_volume\_size](#input\_broker\_volume\_size) | (Optional) The size in GiB of the EBS volume for the data drive on each broker node. Minimum value of 1 and maximum value of 16384. | `number` | `10` | no |
| <a name="input_certificate_authority_arns"></a> [certificate\_authority\_arns](#input\_certificate\_authority\_arns) | (Optional) List of ACM Certificate Authority Amazon Resource Names (ARNs). | `list(string)` | `[]` | no |
| <a name="input_client_allow_unauthenticated"></a> [client\_allow\_unauthenticated](#input\_client\_allow\_unauthenticated) | n/a | `any` | n/a | yes |
| <a name="input_client_broker"></a> [client\_broker](#input\_client\_broker) | (Optional) Encryption setting for data in transit between clients and brokers. Valid values: TLS, TLS\_PLAINTEXT, and PLAINTEXT. Default value is TLS. | `string` | `"TLS"` | no |
| <a name="input_client_sasl_iam_enabled"></a> [client\_sasl\_iam\_enabled](#input\_client\_sasl\_iam\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_client_sasl_scram_enabled"></a> [client\_sasl\_scram\_enabled](#input\_client\_sasl\_scram\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_client_tls_auth_enabled"></a> [client\_tls\_auth\_enabled](#input\_client\_tls\_auth\_enabled) | value | `bool` | `false` | no |
| <a name="input_cloudwatch_logs_enabled"></a> [cloudwatch\_logs\_enabled](#input\_cloudwatch\_logs\_enabled) | (Optional) Indicates whether you want to enable or disable streaming broker logs to Cloudwatch Logs. | `any` | n/a | yes |
| <a name="input_cloudwatch_logs_log_group"></a> [cloudwatch\_logs\_log\_group](#input\_cloudwatch\_logs\_log\_group) | (Optional) Name of the Cloudwatch Log Group to deliver logs to. | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (Required) Name of the MSK cluster. | `any` | n/a | yes |
| <a name="input_create_cluster"></a> [create\_cluster](#input\_create\_cluster) | n/a | `any` | n/a | yes |
| <a name="input_create_msk_configuration"></a> [create\_msk\_configuration](#input\_create\_msk\_configuration) | (Optional) Create MSK Cluster configuration. | `bool` | `true` | no |
| <a name="input_encryption_at_rest_kms_key_arn"></a> [encryption\_at\_rest\_kms\_key\_arn](#input\_encryption\_at\_rest\_kms\_key\_arn) | n/a | `any` | n/a | yes |
| <a name="input_encryption_in_cluster"></a> [encryption\_in\_cluster](#input\_encryption\_in\_cluster) | (Optional) Whether data communication among broker nodes is encrypted. Default value: true. | `bool` | `true` | no |
| <a name="input_enhanced_monitoring"></a> [enhanced\_monitoring](#input\_enhanced\_monitoring) | (Optional) Specify the desired enhanced MSK CloudWatch monitoring level. See Monitoring Amazon MSK with Amazon CloudWatch | `any` | n/a | yes |
| <a name="input_firehose_delivery_stream"></a> [firehose\_delivery\_stream](#input\_firehose\_delivery\_stream) | (Optional) Name of the Kinesis Data Firehose delivery stream to deliver logs to. | `any` | n/a | yes |
| <a name="input_firehose_logs_enabled"></a> [firehose\_logs\_enabled](#input\_firehose\_logs\_enabled) | (Optional) Indicates whether you want to enable or disable streaming broker logs to Kinesis Data Firehose. | `any` | n/a | yes |
| <a name="input_jmx_exporter_enabled"></a> [jmx\_exporter\_enabled](#input\_jmx\_exporter\_enabled) | (Required) Indicates whether you want to enable or disable the JMX Exporter. | `any` | n/a | yes |
| <a name="input_kafka_version"></a> [kafka\_version](#input\_kafka\_version) | (Required) Name of the MSK cluster. | `any` | n/a | yes |
| <a name="input_msk_configuration_arn"></a> [msk\_configuration\_arn](#input\_msk\_configuration\_arn) | n/a | `string` | n/a | yes |
| <a name="input_msk_configuration_last_revision"></a> [msk\_configuration\_last\_revision](#input\_msk\_configuration\_last\_revision) | n/a | `string` | n/a | yes |
| <a name="input_node_exporter_enabled"></a> [node\_exporter\_enabled](#input\_node\_exporter\_enabled) | (Required) Indicates whether you want to enable or disable the Node Exporter. | `any` | n/a | yes |
| <a name="input_number_of_broker_nodes"></a> [number\_of\_broker\_nodes](#input\_number\_of\_broker\_nodes) | (Required) The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets. | `any` | n/a | yes |
| <a name="input_public_access_enabled"></a> [public\_access\_enabled](#input\_public\_access\_enabled) | (Optional) Enable Public access. | `bool` | `false` | no |
| <a name="input_s3_logs_bucket"></a> [s3\_logs\_bucket](#input\_s3\_logs\_bucket) | (Optional) Name of the S3 bucket to deliver logs to. | `any` | n/a | yes |
| <a name="input_s3_logs_enabled"></a> [s3\_logs\_enabled](#input\_s3\_logs\_enabled) | (Optional) Indicates whether you want to enable or disable streaming broker logs to S3. | `any` | n/a | yes |
| <a name="input_s3_logs_prefix"></a> [s3\_logs\_prefix](#input\_s3\_logs\_prefix) | (Optional) Prefix to append to the folder name. | `any` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | (Required) A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster. | `any` | n/a | yes |
| <a name="input_server_properties"></a> [server\_properties](#input\_server\_properties) | (Optional) Contents of the server.properties file. Supported properties are documented in the MSK Developer Guide. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | (Required) A list of subnets to connect to in client VPC. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
