terraform {
  backend "s3" {
    bucket         = "talent-academy-subha2-lab"
    key            = "talent-academy/elk/terraform.tfstates"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock"
  }
}