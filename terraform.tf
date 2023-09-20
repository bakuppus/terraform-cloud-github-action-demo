##################################################################################
# PROVIDERS
##################################################################################



terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8.0"
    }


    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.17.0"
    }

        random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }


    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }




  }
}
