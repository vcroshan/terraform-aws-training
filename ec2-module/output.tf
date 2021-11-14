output "ec2publicip" {
  value = aws_instance.myec2instance[*].public_ip
}