resource "tls_private_key" "internal" {
  algorithm = "RSA"
}

resource "local_file" "internal-private-key" {
  content = "${tls_private_key.internal.private_key_pem}"
  filename = "${path.cwd}/internal_key.pem"
}

module "internal-key" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "internal-key"
  public_key = tls_private_key.internal.public_key_openssh
}
