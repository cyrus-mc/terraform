module "vpc" {

  source = "git@github.com:Smarsh/terraform-vpc.git?ref=1.4.2"
  #source = "../../vpc"

  name = "${var.environment}"

  region = "${var.region}"
  key_name = "${aws_key_pair.devops_key.key_name}"

  cidr_block = "${var.cidr_block}"

  customer_gateway_id = "${data.terraform_remote_state.base.aws_customer_gateway}"

  /* we are in a GovCloud region */
  govcloud = true

  peering_info = [ "services" ]

  create_vgw = false

  enable_kubernetes = true

  public_subnet_tags {
    KubernetesCluster = "${var.environment}"
  }

}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_main_rt_id" {
  value = "${module.vpc.vpc_main_rt_id}"
}

output "vpc_cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}
