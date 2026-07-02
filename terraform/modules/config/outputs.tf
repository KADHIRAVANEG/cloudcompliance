output "recorder_id" {
  value = aws_config_configuration_recorder.main.id
}

output "config_role_arn" {
  value = aws_iam_role.config_role.arn
}
