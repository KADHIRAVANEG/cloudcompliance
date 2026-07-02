# Uncomment for real AWS deployment
# terraform {
#   backend "s3" {
#     bucket         = "your-tfstate-bucket"
#     key            = "cloudcompliance/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }

# Local backend for LocalStack development (default)
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
