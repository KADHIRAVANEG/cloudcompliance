# SOC2 Control: CC7.1
# AWS Config — continuous compliance monitoring

resource "aws_config_configuration_recorder" "main" {
  name     = "${var.project_name}-recorder"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "main" {
  name           = "${var.project_name}-delivery"
  s3_bucket_name = var.audit_bucket_id
  depends_on     = [aws_config_configuration_recorder.main]
}

resource "aws_config_configuration_recorder_status" "main" {
  name       = aws_config_configuration_recorder.main.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.main]
}

resource "aws_iam_role" "config_role" {
  name = "${var.project_name}-config-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "config.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  tags = {
    Name        = "${var.project_name}-config-role"
    SOC2Control = "CC7.1"
    Project     = var.project_name
  }
}

resource "aws_iam_role_policy_attachment" "config_role" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}

# Config rule — detect public S3 buckets
resource "aws_config_config_rule" "s3_public_read_prohibited" {
  name = "${var.project_name}-s3-public-read-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

  depends_on = [aws_config_configuration_recorder_status.main]

  tags = {
    SOC2Control = "CC7.1"
    Project     = var.project_name
  }
}

# Config rule — detect unencrypted S3 buckets
resource "aws_config_config_rule" "s3_encryption_enabled" {
  name = "${var.project_name}-s3-encryption-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder_status.main]

  tags = {
    SOC2Control = "CC6.7"
    Project     = var.project_name
  }
}

# Config rule — detect MFA on root account
resource "aws_config_config_rule" "root_mfa_enabled" {
  name = "${var.project_name}-root-mfa-enabled"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder_status.main]

  tags = {
    SOC2Control = "CC6.2"
    Project     = var.project_name
  }
}
