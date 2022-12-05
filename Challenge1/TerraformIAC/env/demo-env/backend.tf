terraform {
  backend "s3" {
    bucket         = "terraform-backend"
    key            = "network"
    region         = "us-east-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::<AWS_ACCOUNT_ID_OF_BACKEND>:role/terraform-backend"
  }
}