# # terraform 
#   backend "s3" {
#     bucket         = "s7-tf-state"           # Replace with your S3 bucket for state
#     key            = "s3-backend/modules/terraform.tfstate" # Path within the bucket for the state file
#     region         = "us-east-1"              # AWS region for the bucket
#     encrypt        = true                        # Enable encryption for the state file
#     dynamodb_table = "s7-tf-state-lock"     # Replace with your DynamoDB table for locking
#   }

