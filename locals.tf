locals {
  service_env      = "${var.service_name}-${var.env}"
  prefix           = "${var.service_name}-${var.env}"
  cluster_name     = "${var.service_name}-${var.env}"
  public_alb_name  = "${var.service_name}-public-${var.env}"
  private_alb_name = "${var.service_name}-private-${var.env}"
}