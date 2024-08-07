output "cluster_name" {
    description = "AWS EKS cluster name"
    value = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint URL to access cluster"
  value = module.eks.cluster_endpoint
}

output "region" {
  description = "AWS EKS cluster region"
  value = var.region
}

output "cluster_security_group_id" {
    description = "AWS EKS cluster security group ID"
    value = module.eks.cluster_security_group_id
}