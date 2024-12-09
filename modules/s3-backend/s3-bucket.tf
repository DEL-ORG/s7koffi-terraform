# Source S3 Bucket
resource "aws_s3_bucket" "state" {
  provider = aws.source
  bucket   = format("%s-%s-%s-s7-tf-state", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  tags = var.common_tags
}

# Replication Configuration for Source Bucket
resource "aws_s3_bucket_replication_configuration" "state_replication" {
  depends_on = [
    aws_s3_bucket.state,
    aws_s3_bucket.backup
  ]
  bucket = aws_s3_bucket.state.id
  role   = aws_iam_role.replication.arn

  rule {
    id     = "StateReplicationAll"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup.arn
      storage_class = "STANDARD"
    }
  }
}

# Destination S3 Bucket
resource "aws_s3_bucket" "backup" {
  provider = aws.backup
  bucket   = format("%s-%s-%s-s7-tf-state-backup", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])

  tags = var.common_tags
}

# Versionning for source bucket
resource "aws_s3_bucket_versioning" "source_versioning" {
  depends_on = [aws_s3_bucket.state]
  bucket     = aws_s3_bucket.state.id
  provider   = aws.source
  versioning_configuration {
    status = "Enabled"
  }
}
# Versioning for Destination Bucket
resource "aws_s3_bucket_versioning" "backup_versioning" {
  depends_on = [aws_s3_bucket.backup]
  bucket     = aws_s3_bucket.backup.id
  provider   = aws.backup
  versioning_configuration {
    status = "Enabled"
  }
}

# # ACL for Source Bucket
# resource "aws_s3_bucket_acl" "state_acl" {
#   bucket = aws_s3_bucket.state.id
#   acl    = "private"
# }

# # ACL for Destination Bucket
# resource "aws_s3_bucket_acl" "backup_acl" {
#   bucket = aws_s3_bucket.backup.id
#   acl    = "private"
# }
