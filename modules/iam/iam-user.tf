# Create IAM user
resource "aws_iam_user" "mensah" {
  name = var.user_name
}