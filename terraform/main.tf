provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "lepiota-tfstate"
    key    = "terraformt.tfstate"
    region = "us-east-1"
  }
}
