resource "tls_private_key" "deployer" {
  algorithm = "RSA"
}
resource "aws_key_pair" "generated_key" {
  key_name   = "deployer"
  public_key = "${tls_private_key.deployer.public_key_openssh}"
  depends_on = [
    tls_private_key.deployer
  ]
}
resource "local_file" "key" {
  content         = "${tls_private_key.deployer.private_key_pem}"
  filename        = "deployer.pem"
  file_permission = "0400"
  depends_on = [
    tls_private_key.deployer
  ]
}
