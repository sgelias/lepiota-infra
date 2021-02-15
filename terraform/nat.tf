resource "aws_eip" "gw" {
  vpc = true

  tags = {
    Environment = "lepista"
  }
}

resource "aws_nat_gateway" "gw" {
  subnet_id     = aws_subnet.public.id
  allocation_id = aws_eip.gw.id

  tags = {
    Environment = "lepista"
  }
}
