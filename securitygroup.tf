resource "aws_security_group" "bastian_host_packer" {
  name        = "bastianHost"
  description = "Aloow connection for bastion"
  vpc_id      = aws_vpc.elk.id

  ingress {
    from_port   = 80
    to_port     = 80
    description = "allow 80 port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    description = "allow 22 port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags= {
    Name = "PAcker_bastion_sg"
  }
}

resource "aws_security_group" "elksg" {
  name        = "elksg"
  description = "Allow connection for kibana ec2 instance"
  vpc_id      = aws_vpc.elk.id
#elasticsearch
  ingress {
    from_port   = 9200
    to_port     = 9200
    description = "allow 9200 port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#logstash
  ingress {
    from_port   = 5043
    to_port     = 5044
    description = "allow  logstash port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #kibana
  ingress {
    from_port   = 5601
    to_port     = 5601
    description = "allow kibana port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    description = "allow 80 port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    description = "allow 22 port"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags= {
    Name = "elk sg"
  }
}
