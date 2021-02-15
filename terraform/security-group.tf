resource "aws_security_group" "ssh_access" {
  name        = "lepista-k8s"
  description = "Allow http access"
  vpc_id      = aws_vpc.main.id

  ingress = {
    description = "ssh_access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh_access"
  }
}
