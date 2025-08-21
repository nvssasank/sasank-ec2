output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.my_ec2.id
}

output "security_group_id" {
  description = "ID of the security group attached to EC2"
  value       = aws_security_group.ec2_sg.id
}