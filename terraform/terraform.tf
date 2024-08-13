terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }

      kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.31.0"
      }

      random = {
        source = "hashicorp/random"
        version = "3.6.2"
      }

      tls = {
        source = "hashicorp/tls"
        version = "4.0.5"
      }
      
    }

    backend "s3" {
      bucket = "steamscraper-terraform"
      key    = "terraform.tfstate"
      region = var.region
    }
    
    required_version = ">= 1.9.3"
}