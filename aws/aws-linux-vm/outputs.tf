output "private_ip" {
  description = "Private IPs of instance"
  value       = aws_network_interface.eni.private_ip
}
output "instance_id" {
  description = "AWS EC2 instance id"
  value       = aws_instance.instance.id
}
