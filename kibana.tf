resource "aws_instance" "Kibana_server" {
  ami           = var.kibana_ami_id
  instance_type = "t3.medium"

  vpc_security_group_ids = [aws_security_group.elksg.id]
  key_name               = "KeyPAir"
  subnet_id              = aws_subnet.public.id

  tags = {
    Name = "Kibana"
  }
}
