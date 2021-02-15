resource "aws_vpc" "main" {
  id                   = "lepista-k8s-${var.hash_commit}"
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "lepista"
  }
}
