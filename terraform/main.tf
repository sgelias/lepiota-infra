provider "aws" {
  region  = var.aws_region
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "lepista-iaas-tfstate"
    key    = "terraformt.tfstate"
    region = "us-east-1"
  }
}
