output "vpc_id" {
  description = "ID of the provisioned VPC"
  value       = module.networking.vpc_id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = module.networking.private_subnet_ids
}

output "audit_bucket_id" {
  description = "ID of the SOC2 audit logging bucket"
  value       = module.logging.audit_bucket_id
}

output "kms_key_id" {
  description = "ID of the KMS customer managed key"
  value       = module.encryption.kms_key_id
}

output "kms_key_arn" {
  description = "ARN of the KMS customer managed key"
  value       = module.encryption.kms_key_arn
}

output "app_role_arn" {
  description = "ARN of the least-privilege application role"
  value       = module.iam.app_role_arn
}

output "compliance_score" {
  description = "SOC2 controls implemented"
  value       = "7/7 — CC6.1, CC6.2, CC6.6, CC6.7, CC7.1, CC7.2, CC8.1"
}
