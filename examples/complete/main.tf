# Example: Deploy full SOC2 baseline using CloudCompliance module
# This provisions all 7 SOC2 controls in one call

module "cloudcompliance" {
  source = "../../terraform"

  project_name        = "my-startup"
  environment         = "prod"
  aws_region          = "us-east-1"
  localstack_endpoint = "" # empty = real AWS
}

output "vpc_id" {
  value = module.cloudcompliance.vpc_id
}

output "audit_bucket" {
  value = module.cloudcompliance.audit_bucket_id
}
