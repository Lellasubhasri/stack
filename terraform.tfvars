vpc_name      = "elk"
aws_region    = "ap-southeast-1"
vpc_cidr      = "192.168.0.0/16"
cidr_public   = "192.168.1.0/24"
cidr_private  = "192.168.2.0/24"
cidr_private1 = "192.168.3.0/24"
cidr_private2 = "192.168.4.0/24"
cidr_private3 = "192.168.5.0/24"


elasticsearch_ami_id = "ami-05707a4435ead06d6"
logstash_ami_id      = "ami-0b1ca537596b66bed"
kibana_ami_id        = "ami-06211e9c83f814c3a"
filebeat_ami_id = "ami-0254edabadf478bf4"
