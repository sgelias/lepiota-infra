output "ip_address" {
  count = var.instance_count
  value = aws_instance.web[count.index].public_ip
}
