terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
   } 
}

provider "aws" {
    region = "ap-south-1"  
}

#Create VPC
resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "my-vpc"
    }
  }

#Public Subnet
resource "aws_subnet" "public-sub" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my-vpc.id
    availability_zone = "ap-south-1a"
    tags = {
      Name = "public-sub"
    }
  }

#Private Subnet
resource "aws_subnet" "private-sub" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my-vpc.id
    availability_zone = "ap-south-1a"
    tags = {
      Name = "private-sub"
    }
  }

#Internet Gateway
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
      Name = "my-igw"
    }
  
}

#Route Table
 resource "aws_route_table" "my-rt" {
    vpc_id = aws_vpc.my-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
    tags = {
      Name = "my-rt"
    }
}

# Subnet association
resource "aws_route_table_association" "public-sub" {
    route_table_id = aws_route_table.my-rt.id
    subnet_id = aws_subnet.public-sub.id 
}