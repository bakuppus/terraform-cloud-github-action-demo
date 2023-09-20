################################################################################
# Global variables
################################################################################

variable "AWS_ACCESS_KEY_ID" {}

variable "AWS_SECRET_ACCESS_KEY" {}

variable "access_key" {
    default = ""
}

variable "secret_key" {
    default = ""
}


variable "service_name" {
  description = "Service name"
  type        = string
  default     = "kubelancer"
}

variable "env" {
  description = "Environment to apply changes to"
  type        = string
  default     = "dev"
  validation {
    condition     = can(regex("dev|qa|stg|prd", var.env))
    error_message = "Env value must be one of dev|qa|stg|prd."
  }
}


variable "region" {
  description = "The region where AWS operations will take place"
  type        = string
  default     = "us-east-1"
}





################################################################################
# Cluster
################################################################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "develop"
}

variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.24`)"
  type        = string
  default     = "1.27"
}


variable "aws_zone" {
  default = "us-east-1a"
}

