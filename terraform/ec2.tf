data "aws_ami" "ami_commit" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["lepista-k8s-${var.hash_commit}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "web" {
  key_name   = "lepista-iaas"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDzywQTmWxvTN0xWRj0t3XybYtQUVZhSUhAknM4AoVYfCq5WI4A2zq/sPTDLFTbYUlF5148XBU5PqTp9FbI/ZWFLZRqX6ur/pawzIScpsTTAv+hb0NKSd5diHZkIavAl8FgCix67gvYbfHdwgcplhfRRxiaRjEXLH9t/1ON0QR0DpmEGgLkKm0WSpdnEZKJdVmmNlQ6Zw+Kblwk0oxwrfk10DvXdjnt6xPebVOa/04s6wUHF0TGFkdOTvtOqOjOJHqKpoKSttRdzVxQ/RHAT2JXILKoAO3jhbbIWLfpx5Gp1F7unJXr27uZfZan8ALhV9iR9RfoCQSIfvWDRQJpaWwWetT+5XbZST3oxGIZy9zc1LZVUvnFb6lnSE8VQskH8wLBJlSHhkzRMwQabemERADqwNLe6oMwGP8cgbXSNSlJf/hhpidQllWc809Ksa4I9SYZoHmskqgMKGclk0bF3SnyuK3Q7c7ZVhREPPQX2IH2QXy5LYdM1VZxQ5ylKM+UchE= root@33242dfd1a6e"
}

resource "aws_instance" "web" {
  count                       = var.instance_count
  ami                         = lookup(var.ami, var.aws_region)
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = ["${aws_security_group.ssh_access.id}"]
  associate_public_ip_address = true

  tags = {
    Name = "lepista-k8s-${var.hash_commit}"
  }
}
