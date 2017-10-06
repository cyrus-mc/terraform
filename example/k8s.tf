module "k8s-master" {

  source = "git@github.com:Smarsh/terraform-k8s_master.git?ref=2.0.0"

  vpc_id = "${module.vpc.vpc_id}"
  region = "${var.region}"
  ami    = "${lookup(var.ami_coreos, var.region)}"

  /*
    A private hosted zone (Route53) will be created for each cluster ($name.$internal-tld)

    There should not be any overlap between this domain and the default VPC private
    domain
  */
  name = "production"

  /*
    The key pair to install on created instances
  */
  key_pair = "${aws_key_pair.devops_key.key_name}"

  /*
    The IAM instance profile to attach to created instances

    TODO: create cluster specific profile that limits just to that cluster resources
  */
  iam_instance_profile = "${data.terraform_remote_state.base.iam_instance_profile}"

  /*
    TODO: clean this up, maybe combine into one input
  */
  subnets   = [ "${module.vpc.kubernetes_subnet_id}" ]
  ip_ranges = [ "${module.vpc.kubernetes_subnet_cidr_block}" ]


  /*
    TODO: clean up, not sure if you can create human readable callback URLs
  */
  ansible_server = "10.80.2.13:443"
  ansible_callback = "8"
  ansible_host_key = "kubernetes-master"

  /* this region supports Route53 */
  enable_route53 = false

  aws_profile = "govcloud"

}

module "k8s-worker-api-staging" {

  source = "git@github.com:Smarsh/terraform-k8s_worker.git?ref=2.0.0"

  vpc_id  = "${module.vpc.vpc_id}"
  subnets = [ "${module.vpc.kubernetes_subnet_id}" ]

  name = "production"

  api_elb = "${module.k8s-master.api_elb}"
  etcd_elb = "${module.k8s-master.etcd_elb}"
  etcd_servers = "${module.k8s-master.etcd_private_ips}"

  node_labels = {
    "namespace" = "production"
    "stateless" = "true"
    "role"      = "api"
  }

  key_pair = "${aws_key_pair.devops_key.key_name}"

  /* instance type */
  instance_type = "t2.2xlarge"

  region = "${var.region}"

  iam_instance_profile = "${data.terraform_remote_state.base.iam_instance_profile}"

  auto_scaling = { "min" = "1", "max" = "1", "desired" = "1" }

  ansible_callback = "https://10.80.2.13/api/v2/job_templates/9/callback/"

}

