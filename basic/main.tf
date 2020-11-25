provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "test_role" {
  name        = "test_role"
  description = "This is a proper description2"


  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "s3readonly"
  roles      = [aws_iam_role.test_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


output "test_role" {
  value = aws_iam_role.test_role.arn
}


