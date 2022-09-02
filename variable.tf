variable "vpc_name" {
  description = "this is the vpc name"
  type        = string
}

variable "vpc_cidr" {
  description = "this is cidr address"

}

variable "aws_region" {
  description = "resources will deploy here"
  type        = string
}

variable "cidr_public" {
  description = "this is for CIDR public subnet"
}

variable "cidr_private" {
  description = "this is for CIDR private subnet"
}

variable "cidr_private1" {
  description = "this is for CIDR private1 subnet"
}

# variable "ami_name" {
#   description = " This is the owner name"
#   type = string

# }


variable "cidr_private2" {
  description = "this is for CIDR private2 subnet"
}

variable "cidr_private3" {
  description = "this is for CIDR private3 subnet"
}

variable "elasticsearch_ami_id" {
  description = "This is my ami id for ElasticSearch"
  type        = string
}


variable "logstash_ami_id" {
  description = "This is my ami id for Logstash"
  type        = string
}

variable "kibana_ami_id" {
  description = "This is my ami id for Kibana"
  type        = string
}

variable "filebeat_ami_id" {
  description = "This is my ami id for Kibana"
  type        = string
}