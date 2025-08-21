terraform {
  backend "s3" {
    bucket = "sasank-bucket"
    key = "sasank.tfstate"
    region = "eu-west-2"
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}