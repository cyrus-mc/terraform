region = "us-west-2"

# terragrunt remote_state locking
terragrunt = {
  remote_state {
    backend = "s3"
    config = {
      bucket     = "terraform"
      region     = "us-west-2"
      key        = "example/terraform.tfstate"
      lock_table = "terraform-lock-table"
      encrypt    = true
    }
  }
}
