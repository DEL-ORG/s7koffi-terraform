# Source S3 Bucket
resource "aws_s3_bucket" "state" {
  provider = aws.source
  #force_destroy = var.force_destroy
  bucket = format("%s-%s-s7k-tf-state", var.common_tags["environment"], var.common_tags["project"])

  tags = merge(
    var.common_tags,
    { Name = format("%s-%s-s7k-tf-state", var.common_tags["environment"], var.common_tags["project"]) }
  )
}

# Versionning for source bucket
resource "aws_s3_bucket_versioning" "source_versioning" {
  provider = aws.source
  bucket   = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Destination S3 Bucket
resource "aws_s3_bucket" "backup" {
  provider = aws.backup
  #force_destroy = var.force_destroy
  bucket = format("%s-%s-s7k-tf-state-backup", var.common_tags["environment"], var.common_tags["project"])

  tags = merge(
    var.common_tags,
    { Name = format("%s-%s-s7k-tf-state-backup", var.common_tags["environment"], var.common_tags["project"]) }
  )
}


# Versioning for Destination Bucket
resource "aws_s3_bucket_versioning" "backup_versioning" {
  provider = aws.backup
  bucket   = aws_s3_bucket.backup.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Replication Configuration for Source Bucket
resource "aws_s3_bucket_replication_configuration" "state_replication" {
  depends_on = [aws_s3_bucket_versioning.source_versioning, aws_s3_bucket_versioning.backup_versioning]
  provider   = aws.source
  bucket     = aws_s3_bucket.state.id
  role       = aws_iam_role.replication.arn

  rule {
    id     = "StateReplicationRule"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup.arn
      storage_class = "STANDARD"
    }
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
