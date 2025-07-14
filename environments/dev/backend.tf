terraform {
  backend "s3" {
    bucket         = "sha-tfstate-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-lock"
  }
}