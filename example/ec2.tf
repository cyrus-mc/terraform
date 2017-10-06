/*
  Create key-pair used by DevOps engineers
*/
resource "aws_key_pair" "devops_key" {

  key_name   = "${var.environment}-devops-key"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1JvxUlemad8y3BbDWjx0FKoM1EYWUJEF/FOIM+yAcry9Zk8ceRh1nHiw5qLccvPaJHws7bSvUYbqhKiAOdv2u3I5e9i5WEnhOIj/0BTEKxA86PUZnX7FtuTjKHz/F8vg7T3fHPYao3vExcv6dngrdSeLrqUrzoZuB1tnb5ZeSOZR6pjVTMWmCTmmjHZ01olRRel1EQ01I2InU2x5BhEUG3txNtNwECHFX3koKptRuIqAxBhkozgtKjXBjGgJIMTJWtpdhNgkT9F0BhdzvDCgHYDPCicg0744rjmmE42gJ4QiEXuhawQlLQKgMwB7n8H4fNoAxPRXzGyFUbvTBk9DF"

}
