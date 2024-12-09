# terraform {
#   backend "s3" {
#     bucket         = "2024-dev-s7project-s7-tf-state"
#     key            = "s3-backend/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "2024-dev-s7project-s7-tf-state-lock"
#     encrypt        = true
#   }
# }
