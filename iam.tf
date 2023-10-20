
resource "aws_iam_role" "RDS-SSM-AutoStart-AutoStop" {
  name = "RDS-SSM-AutoStart-AutoStop"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ssm.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
}


resource "aws_iam_role_policy" "RDS-SSM-AutoStart-AutoStop-policy" {
  name        = "RDS-SSM-AutoStart-AutoStop-policy"
  role = aws_iam_role.RDS-SSM-AutoStart-AutoStop.id
  policy = jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
            "Effect": "Allow",
            "Action": [
                "rds:Describe*",
                "rds:Start*",
                "rds:Stop*",
                "rds:Reboot*",
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:RebootInstances"
            ],
            "Resource": "*"
        }
	]
})
}
