resource "aws_s3_bucket" "state" {
  provider = aws.state
  bucket   = format("%s-%s-%s-s7-tf-state", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  versioning {
    enabled = true
  }

  replication_configuration {
    role = aws_iam_role.replication.arn

    rules {
      id     = "StateReplicationAll"
      prefix = ""
      status = "Enabled"

      destination {
        bucket        = aws_s3_bucket.backup.arn
        storage_class = "STANDARD"
      }
    }
  }

  tags = var.common_tags
}

resource "aws_s3_bucket_acl" "state_acl" {
  bucket = aws_s3_bucket.state.id
  acl    = "private"
}

resource "aws_s3_bucket" "backup" {
  provider = aws.backup
  bucket   = format("%s-%s-%s-s7-tf-state-backup", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  versioning {
    enabled = true
  }

  tags = var.common_tags
}

resource "aws_s3_bucket_acl" "backup_acl" {
  bucket = aws_s3_bucket.backup.id
  acl    = "private"
}
