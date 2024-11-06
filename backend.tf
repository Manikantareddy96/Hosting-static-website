terraform {
  backend "s3" {
    bucket         = "nagahosting"
    key            = "my-terraform-environment/main"
    region         = "ap-south-1"
    dynamodb_table = "manikanta"
  }
}
