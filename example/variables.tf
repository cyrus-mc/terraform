# retrieve all availability zones
data "aws_availability_zones" "all" {}

variable "ami_coreos" {
  description = "The AMI id for CoreOS"
  default {
    "us-west-2"     = "ami-37ee6357"
    "us-gov-west-1" = "ami-05971364"
  }
}

variable "internal-tld" {
  description = "Top-level domain"
  default     = "aws"
}
