output "control_public_ip" {
  value = aws_instance.ansible_control.public_ip
}

output "managed_public_ip" {
  value = aws_instance.ansible_managed.public_ip
}

output "managed_private_ip" {
  value = aws_instance.ansible_managed.private_ip
}
