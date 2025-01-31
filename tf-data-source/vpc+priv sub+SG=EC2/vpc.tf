#VPC
resource "aws_vpc" "pro-vpc" {

    cidr_block = "10.0.0.0/16"
tags = {
  Name = "pro-vpc"
}

  }

#Pub Sub
resource "aws_subnet" "pro-vpc-pub" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.pro-vpc.id
    availability_zone = "ap-south-1a"
    tags = {
      Name = "pro-vpc-pub"
    }
  }

#Prv Sub
resource "aws_subnet" "pro-vpc-prv" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.pro-vpc.id
     availability_zone = "ap-south-1a"
    tags = {
      Name = "pro-vpc-prv"
    }
  }

#igw
resource "aws_internet_gateway" "pro-vpc-igw" {
    vpc_id = aws_vpc.pro-vpc.id
  tags = {
      Name = "pro-vpc-igw"
    }
}

#RT
resource "aws_route_table" "pro-vpc-rt" {
    vpc_id = aws_vpc.pro-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.pro-vpc-igw.id
    }

  tags = {
      Name = "pro-vpc-rt"
    }
}

# Subnet association
resource "aws_route_table_association" "pro-vpc-pub" {
    route_table_id = aws_route_table.pro-vpc-rt.id
    subnet_id = aws_subnet.pro-vpc-pub.id

    }


