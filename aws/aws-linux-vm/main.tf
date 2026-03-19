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

resource "aws_instance" "instance" {
  ami                  = var.amiId
  instance_type        = var.aws_instance_type
  ebs_optimized        = true
  tags = merge(
    var.tags,
    {
      "Name" = var.hostname
    },
  )

  root_block_device {
    volume_size = var.root_block_device_volume_size
    delete_on_termination = true
  }
}
