# Criar subnet public para cada AZ
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8)

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "public" {
  vpc_id                      = aws_vpc.main.id
  cidr_block                  = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  map_public_ip_on_launch     = true

  tags = {
    Name = "Public"
  }
}
