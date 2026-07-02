variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "local"
  validation {
    condition     = contains(["local", "dev", "staging", "prod"], var.environment)
    error_message = "Environment must be local, dev, staging, or prod."
  }
}

variable "project_name" {
  type        = string
  description = "Project name used for all resource naming and tagging"
  default     = "cloudcompliance"
}

variable "aws_region" {
  type        = string
  description = "AWS region for deployment"
  default     = "us-east-1"
}

variable "localstack_endpoint" {
  type        = string
  description = "LocalStack endpoint — set to empty string for real AWS"
  default     = "http://localhost:4566"
}
