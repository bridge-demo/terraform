output "cluster_arn" {
  description = "ARN of the cluster"
  value       = aws_eks_cluster.ekscluster.arn
}

output "endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = aws_eks_cluster.ekscluster.endpoint
}

output "cluster_id" {
  description = "Name of the cluster"
  value       = aws_eks_cluster.ekscluster.id
}
