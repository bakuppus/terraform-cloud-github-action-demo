provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region  = var.region

  default_tags {
    tags = {
      Environment = var.env
      Service     = var.service_name
      Terraform   = "true"
    }
  }
}

