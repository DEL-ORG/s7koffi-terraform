resource "aws_dynamodb_table" "s7-tf-state-lock" {
  provider = aws.source
  name     = format("%s-%s-%s-s7-tf-state-lock", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
  hash_key = "LockID"
  #   read_capacity  = 20
  #   write_capacity = 20
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.common_tags
}