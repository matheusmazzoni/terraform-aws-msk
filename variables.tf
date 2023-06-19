variable "create_cluster" {

}
variable "create_msk_configuration" {

}
variable "server_properties" {
    description = "(Optional) Contents of the server.properties file. Supported properties are documented in the MSK Developer Guide."
    default = null
    type = string
}
variable "cluster_name" {
  description = "(Required) Name of the MSK cluster."
}
variable "kafka_version" {
  description = "(Required) Name of the MSK cluster."
}
variable "number_of_broker_nodes" {
  description = "(Required) The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets."
}
variable "enhanced_monitoring" {
  description = "(Optional) Specify the desired enhanced MSK CloudWatch monitoring level. See Monitoring Amazon MSK with Amazon CloudWatch"
}
variable "broker_instance_type" {
  description = "(Required) Specify the instance type to use for the kafka brokersE.g., kafka.m5.large. (Pricing info)"
}
variable "subnet_ids" {
  description = "(Required) A list of subnets to connect to in client VPC."
}
variable "security_group_ids" {
  description = "(Required) A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster."
}
variable "broker_volume_size" {
  description = "(Optional) The size in GiB of the EBS volume for the data drive on each broker node. Minimum value of 1 and maximum value of 16384."
  default     = 10
  type        = number
}
variable "public_access_enabled" {
  description = "(Optional) Enable Public access."
  default     = false
  type        = bool
}
variable "create_msk_configuration" {
  description = "(Optional) Create MSK Cluster configuration."
  default     = true
  type        = bool
}
variable "msk_configuration_arn" {
  type = string
}
variable "msk_configuration_last_revision" {
  type = string
}
variable "client_broker" {
  description = "(Optional) Encryption setting for data in transit between clients and brokers. Valid values: TLS, TLS_PLAINTEXT, and PLAINTEXT. Default value is TLS."
  default     = "TLS"
  type        = string
}
variable "encryption_in_cluster" {
  description = "(Optional) Whether data communication among broker nodes is encrypted. Default value: true."
  default     = true
  type        = bool
}
variable "encryption_at_rest_kms_key_arn" {

}
variable "client_allow_unauthenticated" {

}
variable "client_tls_auth_enabled" {
  description = "value"
  default     = false
  type        = bool
}
variable "certificate_authority_arns" {
  description = "(Optional) List of ACM Certificate Authority Amazon Resource Names (ARNs)."
  default     = []
  type        = list(string)
}
variable "client_sasl_scram_enabled" {
  type = bool
}
variable "client_sasl_iam_enabled" {
  type = bool
}
variable "jmx_exporter_enabled" {
  description = "(Required) Indicates whether you want to enable or disable the JMX Exporter."
}
variable "node_exporter_enabled" {
  description = "(Required) Indicates whether you want to enable or disable the Node Exporter."
}
variable "cloudwatch_logs_enabled" {
  description = "(Optional) Indicates whether you want to enable or disable streaming broker logs to Cloudwatch Logs."
}
variable "cloudwatch_logs_log_group" {
  description = "(Optional) Name of the Cloudwatch Log Group to deliver logs to."
}
variable "firehose_logs_enabled" {
  description = "(Optional) Indicates whether you want to enable or disable streaming broker logs to Kinesis Data Firehose."
}
variable "firehose_delivery_stream" {
  description = "(Optional) Name of the Kinesis Data Firehose delivery stream to deliver logs to."
}
variable "s3_logs_enabled" {
  description = "(Optional) Indicates whether you want to enable or disable streaming broker logs to S3."
}
variable "s3_logs_bucket" {
  description = "(Optional) Name of the S3 bucket to deliver logs to."
}
variable "s3_logs_prefix" {
  description = "(Optional) Prefix to append to the folder name."
}
variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
