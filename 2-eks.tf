module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster.name
  cluster_version = var.cluster.version

  cluster_endpoint_public_access  = true
  create_cloudwatch_log_group = false
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  enable_irsa = true
  eks_managed_node_group_defaults = {
    disk_size = 50
    ami_type = var.eks-node-grp-1.ami_type
    # image_id = "ami-083a4b47b26349164"
    manage_aws_auth_configmap = true
  }

  eks_managed_node_groups = {
    (var.eks-node-grp-1.node_group_name) = {
      desired_size = var.eks-node-grp-1.desired_size
      min_size     = var.eks-node-grp-1.min_size
      max_size     = var.eks-node-grp-1.max_size

      labels = var.eks-labels
      
      instance_types = [var.eks-node-grp-1.instance_types]
      capacity_type  = var.eks-node-grp-1.capacity_type
      labels = {
        role = var.eks-node-grp-1.labels
      }
      # taints  =   [var.node_grp-1-taints]
    }
  }
}
