# terraform {
#   backend "s3" {
#     bucket         = "dev-backend-project-s7k-tf-state"
#     key            = "s3-backend/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dev-backend-project-s7k-tf-state-lock"
#     encrypt        = true
#   }
# }
