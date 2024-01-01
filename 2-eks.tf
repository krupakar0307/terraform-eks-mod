module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "eks-test"
  cluster_version = "1.27"

  cluster_endpoint_public_access  = true
  create_cloudwatch_log_group = false
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  enable_irsa = true
  eks_managed_node_group_defaults = {
    disk_size = 50
    ami_type = "BOTTLEROCKET_x86_64"
    # image_id = "ami-083a4b47b26349164"
    manage_aws_auth_configmap = true
  }


  eks_managed_node_groups = {
    node-group-general = {
      desired_size = 1
      min_size     = 1
      max_size     = 3

      labels = {
        role = "general"
      }

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"

    }

    node-group-spot = {
      desired_size = 2
      min_size     = 1
      max_size     = 3

      labels = {
        role = "spot"
      }

      taints = [{
        key    = "market"
        value  = "spot"
        effect = "NO_SCHEDULE"
      }]

      instance_types = ["t3.micro"]
      capacity_type  = "SPOT"
    }
  }
}
