variable "region" {
  description = "Specifies AWS region"
  type        = string
  default = "us-east-1"
}
variable "clustername" {
  type        = string
  description = "EKS cluster name"
}
