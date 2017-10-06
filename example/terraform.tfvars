environment = "production"
cidr_block = "10.81.0.0/16"

region = "us-gov-west-1"

# terragrunt remote_state locking
terragrunt = {
  remote_state {
    backend = "s3"
    config = {
      bucket     = "terraform"
      region     = "us-gov-west-1"
      key        = "example/terraform.tfstate"
      lock_table = "terraform-lock-table"
      encrypt    = true
      profile    = "govcloud"
    }
  }
}

