# retrieve all availability zones
data "aws_availability_zones" "all" {}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "ami_coreos" {
  description = "The AMI id for CoreOS"
  default {
    "us-west-2" = "ami-37ee6357"
  }
}

variable "cidr_blocks" {
  description = "VPC CIDR blocks used for each environment"
  default {
    "development" = "10.68.0.0/16"
    "production"  = "10.65.0.0/16"
    "test"        = "10.72.0.0/16"
  }
}

variable "internal-tld" {
  description = "Top-level domain"
  default     = "aws"
}

