resource "aws_instance" "Filebeat_server" {
  ami           = var.filebeat_ami_id
  instance_type = "t3.medium"

  vpc_security_group_ids = [aws_security_group.elksg.id]
  key_name               = "KeyPAir"
  subnet_id              = aws_subnet.private1.id

  tags = {
    Name = "filebeat"
  }
}