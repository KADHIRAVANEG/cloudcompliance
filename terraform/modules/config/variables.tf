variable "project_name" {
  type    = string
  default = "cloudcompliance"
}

variable "audit_bucket_id" {
  type        = string
  description = "S3 bucket ID for Config delivery channel"
}
