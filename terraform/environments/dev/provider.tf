provider "aws" {
  region  = "hogehoge"
  profile = "hogehoge"
  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/Terraform"
  }
}
