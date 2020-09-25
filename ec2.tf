resource "aws_instance" "drone" {
  ami                    = "ami-06cf02a98a61f9f5e" # CentOS Linux release 7.8.2003 (Core)
  instance_type          = "t3.micro"
  key_name               = "${aws_key_pair.generated_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  subnet_id              = "${aws_subnet.public.id}"

  tags = {
    Name = "test"
  }
}
