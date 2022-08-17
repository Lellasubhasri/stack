resource "aws_vpc" "elk" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}
