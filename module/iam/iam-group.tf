# Create IAM group
resource "aws_iam_group" "family_group" {
  name = var.group_name
}
