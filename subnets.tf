resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.elk.id
  cidr_block              = var.cidr_public
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "kibana_public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.elk.id
  cidr_block        = var.cidr_private
  availability_zone = "ap-southeast-2a"
  #map_public_ip_on_launch = true

  tags = {
    Name = "Monitoring_private"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.elk.id
  cidr_block        = var.cidr_private1
  availability_zone = "ap-southeast-2a"
  # map_public_ip_on_launch = true

  tags = {
    Name = "application_private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.elk.id
  cidr_block        = var.cidr_private2
  availability_zone = "ap-southeast-2b"
  # map_public_ip_on_launch = true

  tags = {
    Name = "application_private2"
  }
}
resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.elk.id
  cidr_block        = var.cidr_private3
  availability_zone = "ap-southeast-2c"
  # map_public_ip_on_launch = true
  tags = {
    Name = "Application_private3"
  }
}
