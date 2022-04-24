terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.50.0"
    }
  }
  backend "s3" {
    bucket         = "hogehoge"
    key            = "hogehoge.tfstate"
    dynamodb_table = "hogehoge"
    region         = "hogehoge"
  }
}
