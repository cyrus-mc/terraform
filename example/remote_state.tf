terraform {
  backend "s3" {
    bucket  = "terraform"
    region  = "us-gov-west-1"
    key     = "example/terraform.tfstate"
    profile = "govcloud"
  }
}

data "terraform_remote_state" "base" {
  backend = "s3"
  config {
    bucket  = "terraform"
    region  = "${var.region}"
    key     = "base/terraform.tfstate"
    profile = "govcloud"
  }
}

data "terraform_remote_state" "services" {
  backend = "s3"
  config {
    bucket  = "terraform"
    region  = "${var.region}"
    key     = "services/terraform.tfstate"
    profile = "govcloud"
  }
}
