variable "create_lock_table" {
  type    = bool
  default = false
}

resource "aws_dynamodb_table" "terraform_locks" {
  count        = var.create_lock_table ? 1 : 0
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}