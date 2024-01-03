module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"
  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs                 ##["ap-south-1a", "ap-south-1b"]
  private_subnets = var.private_subnets     ##["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = var.public_subnets      ##["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Terraform = "true"
    Environment = var.vpc-tags
  }
}