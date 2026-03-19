terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

provider "aws" {
  region = var.region
}

##### Resource

resource "aws_eks_cluster" "ekscluster" {
  name = var.clustername
  access_config {
    authentication_mode = "API"
  }
  role_arn = "arn:aws:iam::917246193809:role/poaAmazonEKSAutoClusterRole"
  version  = "1.35"
  bootstrap_self_managed_addons = false
  
  compute_config {
    enabled       = true
    node_pools    = ["general-purpose"]
    node_role_arn = "arn:aws:iam::917246193809:role/poaAmazonEKSNodeRole"
  }

  kubernetes_network_config {
    elastic_load_balancing {
      enabled = true
    }
  }

  storage_config {
    block_storage {
      enabled = true
    }
  }

  vpc_config {
    subnet_ids = ["subnet-0c43309489b4d8fcf", "subnet-0e891385b3a9747d6"]
  }
}
