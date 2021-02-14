resource "aws_key_pair" "web" {
  key_name   = "lepista-iaas"
  public_key = file("../.secrets/lepista-iaas.pub")
}

resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"

  tags = {
    Name = "lepista-iaas"
  }
}
