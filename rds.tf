resource "aws_ssm_association" "RDS-Start" {
  association_name = "RDS-Start"
  name = "AWS-StartRdsInstance"
  schedule_expression = "cron(30 3 ? * * *)"
  apply_only_at_cron_interval = true
  parameters = {
    "AutomationAssumeRole" = aws_iam_role.RDS-SSM-AutoStart-AutoStop.arn
}
 automation_target_parameter_name = "InstanceId"
  targets {
    key    = "tag:AutoStart"
    values = ["Yes"]
  }
}

resource "aws_ssm_association" "RDS-Stop" {
  association_name = "RDS-Stop"
  name = "AWS-StopRdsInstance"
  schedule_expression = "cron(30 15 ? * * *)"
  apply_only_at_cron_interval = true
  parameters = {
    "AutomationAssumeRole" = aws_iam_role.RDS-SSM-AutoStart-AutoStop.arn
}
 automation_target_parameter_name = "InstanceId"
  targets {
    key    = "tag:AutoStop"
    values = ["Yes"]
  }
}

resource "aws_ssm_association" "RDS-Stop-Sat" {
  association_name = "RDS-Stop-Sat"
  name = "AWS-StopRdsInstance"
  schedule_expression = "cron(0 4 ? * SAT *)"
  apply_only_at_cron_interval = true
  parameters = {
    "AutomationAssumeRole" = aws_iam_role.RDS-SSM-AutoStart-AutoStop.arn
}
 automation_target_parameter_name = "InstanceId"
  targets {
    key    = "tag:AutoStop"
    values = ["Yes"]
  }
}

resource "aws_ssm_association" "RDS-Stop-Sun" {
  association_name = "RDS-Stop-Sun"
  name = "AWS-StopRdsInstance"
  schedule_expression = "cron(0 4 ? * SUN *)"
  apply_only_at_cron_interval = true
  parameters = {
    "AutomationAssumeRole" = aws_iam_role.RDS-SSM-AutoStart-AutoStop.arn
}
 automation_target_parameter_name = "InstanceId"
  targets {
    key    = "tag:AutoStop"
    values = ["Yes"]
  }
}
