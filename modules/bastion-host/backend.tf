# terraform {
#     backend "s3" {
#     bucket         = "s7-tf-state"           
#     key            = "bastion-host/terraform.tfstate" 
#     region         = "us-east-1"                                 
#     dynamodb_table = "s7-tf-state-lock"  
#     encrypt        = true    
#   }
# }
