resource "aws_dynamodb_table" "this" {
  name         = "${var.env}-terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.env}-terraform-lock"
  }
}