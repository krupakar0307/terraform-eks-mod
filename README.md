### EKS Module (Open Source)

#### This repo. consists of eks with in vpc (opensource modules by terraform)
This terraform provisions vpc with 2 private and public subnets, and provisions eks cluster.
I have included `tfvars` file. those should not be commited to github, but for an idea of structure i have pushed them.

#### Usage:
1. clone the repo.
2. provide your inputs in `staging.tfvars` and `prod.tfvars` files to provision 2 clusters for non prod and prod at a time. 
3. create two aws profiles first, it to be provision with in diffent or same regions (alias region if different).
4. perform   `terraform init`, `terraform plan --var-file=staging.tfvars` and apply.