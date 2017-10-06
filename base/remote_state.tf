# specify the provider and access details
provider "aws" {
  region     = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "terraform"
    region = "us-west-2"
    key    = "base/terraform.tfstate"
  }
}
