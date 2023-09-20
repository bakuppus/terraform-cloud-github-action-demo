data "aws_availability_zones" "available" {}

locals {
  name   = "ex-${replace(basename(path.cwd), "_", "-")}"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version =  ">= 5.0.0"

  name  = local.service_env

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]
  database_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 64)]


  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true



  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    "kubernetes.io/role/internal-elb"     = 1
    "karpenter.sh/discovery" = var.cluster_name
  }

}
