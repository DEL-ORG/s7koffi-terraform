# IAM Role for S3 Replication
resource "aws_iam_role" "replication" {
  provider = aws.source
  name     = format("%s-%s-%s-s3-replication-role", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = var.common_tags
}

# IAM Policy for S3 Replication
resource "aws_iam_policy" "replication" {
  provider = aws.source
  name     = format("%s-%s-%s-s3-replication-policy", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket"
        ],
        Effect   = "Allow",
        Resource = [aws_s3_bucket.state.arn]
      },
      {
        Action = [
          "s3:GetObjectVersion",
          "s3:GetObjectVersionAcl"
        ],
        Effect   = "Allow",
        Resource = ["${aws_s3_bucket.state.arn}/*"]
      },
      {
        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete"
        ],
        Effect   = "Allow",
        Resource = ["${aws_s3_bucket.backup.arn}/*"]
      }
    ]
  })
}

# Attach Policy to IAM Role
resource "aws_iam_policy_attachment" "replication" {
  provider   = aws.source
  name       = format("%s-%s-%s-s3-replication-policy-attachment", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
  roles      = [aws_iam_role.replication.name]
  policy_arn = aws_iam_policy.replication.arn
}