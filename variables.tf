###############################################
############### VPC Variables #################
###############################################

variable "aws_region" {
  type = string
  description = "Provide your aws region"
  default = "ap-south-1"
}

variable "aws_profile" {
  type = string
  default = "default"
}

variable "vpc_name" {
  type = string
  description = "Provide VPC Name"
  default = "myvpc"
}
variable "vpc_cidr" {
  type = string
  description = "Provide VPC cidr range"
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  description = "Provide availabilty Zones"
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "private_subnets" {
  type    = list(string)
  description = "Provide private subnet ranges"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  description = "Provide public subnet ranges"
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "vpc-tags" {
  description = "Provide Tags for environment"
  type = string
  default = "dev"
}

###############################################
############### EKS Variables #################
###############################################

variable "cluster" {
  type = map(any)
  description = "Provide eks cluster details"
  default = {
    "name"                    =   "eks-test"
    "version"                 =   "1.27"
    "endpoint_public_access"  =   true
    "cloudwatch_logs_enable"  =   false
  }
}

variable "eks-node-grp-1" {
  type = map(any)
  description = "Provide eks node details"
  default = {
    "node_group_name"     =   "node-group-1"
    "desired_size"        =   "5"
    "min_size"            =   "1"
    "max_size"            =    "5"
    "instance_types"      =    "t3.medium"
    "ami_type"            =    "BOTTLEROCKET_x86_64"
    "capacity_type"       =    "ON_DEMAND"
    "labels"              =     "dev"
  } 
}
# variable "node_grp-1-taints" {
#   type = map(string)
#   default = {
#     "key" = "market"
#     "value" = "on_demand"
#     "effect" = "NO_SCHEDULE"
#   }
# }
variable "eks-labels" {
  type = map(string)
  default = {
    "Name" = "terraform"
    "team" = "DevOps"
    "ENV" = "Dev"
  }
}