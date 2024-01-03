###############################################
############### VPC Variables #################
###############################################


###############################################
##  NOTE : staging.tfvars or .tfvars files shouldn't commit to github, 
#   but for reference here i'll commit to github just for an idea of format.
###############################################

aws_region = "ap-south-1"
vpc_name = "prod-vpc"
vpc_cidr = "10.0.0.0/16"
profile = "prod"

azs = ["ap-south-1a", "ap-south-1b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]


vpc-tags = "dev"

# ###############################################
# ############### EKS Variables #################
# ###############################################

cluster = {
    "name"                    =   "prod-k8s"
    "version"                 =   "1.27"
    "endpoint_public_access"  =   true
    "cloudwatch_logs_enable"  =   false
}

eks-node-grp-1 = {
    "node_group_name"     =   "node-group-1"
    "desired_size"        =   "5"
    "min_size"            =   "1"
    "max_size"            =    "5"
    "instance_types"      =    "t3.medium"
    "ami_type"            =    "BOTTLEROCKET_x86_64"
    "capacity_type"       =    "ON_DEMAND"
    "labels"              =     "Prod"
}
# node_grp-1-taints = {
#     "key" = "market"
#     "value" = "on_demand"
#     "effect" = "NO_SCHEDULE"
# }
eks-labels = {
    "Name" = "terraform"
    "team" = "DevOps"
    "ENV" = "Prod"
}