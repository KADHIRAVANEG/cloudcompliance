# Remote backend for real AWS deployment
# Uncomment and configure before running in production:
#
# terraform {
#   backend "s3" {
#     bucket         = "your-tfstate-bucket"
#     key            = "cloudcompliance/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }
