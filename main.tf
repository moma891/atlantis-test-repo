terraform {

  required_version = "~> 1.3.0"
}

provider "aws" {
  region = var.aws_region

}

provider "random" {}

#State design
terraform {
  backend "s3" {
    dynamodb_table = "terraform-lock"
    key            = "infra/terraform.tfstate"
    region         = "eu-central-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.3.0"
    }
  }
}
