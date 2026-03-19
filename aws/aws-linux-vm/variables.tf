variable "hostname" {
  type        = string
  description = "Short hostname of virtual machine"
}

variable "aws_instance_type" {
  type        = string
  description = "AWS EC2 Instance type"
  default = "t2.micro"
}

variable "root_block_device_volume_size" {
  type        = string
  description = "AWS Root Block Device Volume Size"
  default     = "64"
}

variable "tags" {
  description = "list of tags to create for resoureces"
  type        = map(string)
  default = {
    "createdBy" = "poa/terraform"
  }
}

variable "amiId" {
  description = "ami Id from which instance needs to be created from"
  default     = "ami-0015bce43071c5586"
  type        = string
}

variable "region" {
  description = "Specifies AWS region"
  type        = string
  default = "us-east-1"
}
