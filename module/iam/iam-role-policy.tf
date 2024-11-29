resource "aws_iam_role_policy" "custom_role_policy" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.custom_role.id
  policy = var.role_policy
}