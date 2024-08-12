provider "aws" {
  region = var.region 
}

provider "kubernetes" {
    # Access endpoint
    host = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}
# List of availability zones available
data "aws_availability_zones" "available" {}
