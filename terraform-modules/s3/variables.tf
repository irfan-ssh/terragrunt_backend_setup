# variables.tf
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}
variable "profile_name" {
  description = "The AWS profile_name name"
  type        = string
}

variable "client_name" {
  description = "S3 bucket client_name"
  type        = string
}
variable "account_id" {
  description = "name of your aws account_id "
  type        = string
}
variable "env" {
  description = "name of your aws env "
  type        = string
}
variable "bucket_sufixx" {
  description = "name of your bucket bucket_sufixx "
  type        = string
}
variable "provisioner" {
  description = "name of your bucket provisioner "
  type        = string
}

