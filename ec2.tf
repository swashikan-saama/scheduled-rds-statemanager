resource "aws_ssm_association" "EC2-Start" {
  association_name = "EC2-Start"
  name = "AWS-StartEC2Instance"
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

resource "aws_ssm_association" "EC2-Stop" {
  association_name = "EC2-Stop"
  name = "AWS-StopEC2Instance"
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

resource "aws_ssm_association" "EC2-Stop-SAT" {
  association_name = "EC2-Stop-SAT"
  name = "AWS-StopEC2Instance"
  schedule_expression = "cron(45 3 ? * SAT *)"
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

resource "aws_ssm_association" "EC2-Stop-START" {
  association_name = "EC2-Stop-SUN"
  name = "AWS-StopEC2Instance"
  schedule_expression = "cron(45 3 ? * SUN *)"
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
