module "eks" {
  # Source for the EKS module from Terraform Registry
  source  = "terraform-aws-modules/eks/aws" 
  version = "~> 20.0"

  # Name of the EKS cluster
  cluster_name    = "steamscraper-eks" 
  # Kubernetes version for the EKS cluster
  cluster_version = "1.30" 
  # Enable public access to the EKS cluster endpoint
  cluster_endpoint_public_access  = true 
  # VPC ID where the EKS cluster will be deployed
  vpc_id                   = module.vpc.vpc_id 
  subnet_ids               = module.vpc.private_subnets


  eks_managed_node_group_defaults = {
    # Specify the Amazon Machine Image (AMI) type for the node groups
    ami_type = "AL2023_x86_64_STANDARD"
  }
  # Define the EKS managed node groups
  eks_managed_node_groups = { 
    fe = {
      name = "frontend-group"
      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 3
      desired_size = 1
    }

    be = {
      name = "backend-group"
      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    db = {
      name = "database-cache-group"
      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 3
      desired_size = 1
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
