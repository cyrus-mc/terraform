/*
  Cisco ASA (pit 621)
*/
resource "aws_customer_gateway" "asa" {
  ip_address = "199.59.55.26"
  bgp_asn    = "65000"
  type       = "ipsec.1"

  tags {
    builtWith = "terraform"
    Name      = "pit621:asa"
  }
}

/* output instance profile ID */
output "aws_customer_gateway" {
  value = "${aws_customer_gateway.asa.id}"
}
