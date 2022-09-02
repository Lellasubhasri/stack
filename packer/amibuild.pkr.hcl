packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

// variable "instance_type" {
//   type    = string
//   default = "t3.small"
// }
// variable "aws_region" {
//   type    = string
//   default = "ap-southeast-2"
// }
// variable "vpc_id" {
//   type    = string
//   default = "vpc-032d4d54903515a30"
// }
// variable "subnet_id" {
//   type    = string
//   default = "subnet-0b3d9b17de6a835d6"
// }
// variable "security_group_id" {
//   type    = string
//   default = "sg-0efaaf5c91687c517"
// }

// // #elasticsearch
// source "amazon-ebs" "ubuntu" {
//   ami_name                    = "elastic"
//   instance_type               = "t3.small"
//   region                      = "ap-southeast-2"
//   vpc_id                      = "vpc-032d4d54903515a30"
//   subnet_id                   = "subnet-0b3d9b17de6a835d6"
//   security_group_id           = "sg-0efaaf5c91687c517"
//   deprecate_at                = "2023-07-29T23:59:59Z"
//   associate_public_ip_address = true

//   source_ami_filter {
//     filters = {
//       name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
//       root-device-type    = "ebs"
//       virtualization-type = "hvm"
//     }
//     most_recent = true
//     owners      = ["099720109477"]
//   }
//   ssh_username = "ubuntu"
//   tags = {
//     "Name" = "elastic"
//   }
// }

// build {
//   name = "elk_packer"

//   sources = [
//     "source.amazon-ebs.ubuntu"
//   ]
//   provisioner "ansible" {
//     playbook_file = "./elasticsearch.yml"
//   }
// }
// #logstash
// source "amazon-ebs" "logstash" {
//   ami_name          = "logstash"
//   instance_type     = "t3.small"
//   region            = "ap-southeast-2"
//   vpc_id            = "vpc-032d4d54903515a30"
//   subnet_id         = "subnet-0b3d9b17de6a835d6"
//   security_group_id = "sg-0efaaf5c91687c517"


//   source_ami_filter {
//     filters = {
//       name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

//       root-device-type    = "ebs"
//       virtualization-type = "hvm"
//     }
//     most_recent = true
//     owners      = ["099720109477"]
//   }
//   ssh_username = "ubuntu"
//   tags = {
//     "Name" = "logstash-Server"
//   }
// }

// build {
//   name = "logstash-packer"

//   sources = [
//     "source.amazon-ebs.logstash"
//   ]


//   provisioner "ansible" {
//     playbook_file = "./logstash.yml"
//   }
// }


#kibana

// source "amazon-ebs" "kibana" {
//   ami_name          = "kibana"
//   instance_type     = "t3.small"
//   region            = "ap-southeast-2"
//   vpc_id            = "vpc-032d4d54903515a30"
//   subnet_id         = "subnet-0b3d9b17de6a835d6"
//   security_group_id = "sg-0efaaf5c91687c517"

//   source_ami_filter {
//     filters = {
//       name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

//       root-device-type    = "ebs"
//       virtualization-type = "hvm"
//     }
//     most_recent = true
//     owners      = ["099720109477"]
//   }
//   ssh_username = "ubuntu"
//   tags = {
//     "Name" = "kibana-Server"
//   }
//   deprecate_at = timeadd(timestamp(), "8766h")
// }

// build {
//   name = "kibana-packer"

//   sources = [
//     "source.amazon-ebs.kibana"
//   ]
//   provisioner "ansible" {
//     playbook_file = "./kibana.yml"
//   }
// }

source "amazon-ebs" "filebeat" {
  ami_name                    = "filebeat"
  instance_type               = "t3.small"
  region                      = "ap-southeast-2"
  vpc_id                      = "vpc-032d4d54903515a30"
  subnet_id                   = "subnet-0b3d9b17de6a835d6"
  security_group_id           = "sg-0efaaf5c91687c517"
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Name" = "filebeat"
  }
}

build {
  name = "elk_packer"

  sources = [
    "source.amazon-ebs.filebeat"
  ]
  provisioner "ansible" {
    playbook_file = "./filebeat.yml"
  }
}

// source "amazon-ebs" "metricbeat" {
//   ami_name                    = "metricbeat"
//   instance_type               = "t3.small"
//   region                      = "ap-southeast-2"
//   vpc_id                      = "vpc-032d4d54903515a30"
//   subnet_id                   = "subnet-0b3d9b17de6a835d6"
//   security_group_id           = "sg-0efaaf5c91687c517"
//   deprecate_at                = "2023-07-29T23:59:59Z"
//   associate_public_ip_address = true

//   source_ami_filter {
//     filters = {
//       name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
//       root-device-type    = "ebs"
//       virtualization-type = "hvm"
//     }
//     most_recent = true
//     owners      = ["099720109477"]
//   }
//   ssh_username = "ubuntu"
//   tags = {
//     "Name" = "metricbeat"
//   }
// }

// build {
//   name = "elk_packer"

//   sources = [
//     "source.amazon-ebs.metricbeat"
//   ]
//   provisioner "ansible" {
//     playbook_file = "./metricbeat.yml"
//   }
// }