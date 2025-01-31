data "aws_vpc" "pro-vpc" {
    tags = {
      Name = "pro-vpc"
    }
  }

data "aws_security_group" "pro-vpc-sg" {
    tags = {
      Name = "pro-vpc-sg"
    }
  }

data "aws_subnet" "pro-vpc-prv" {
    tags = {
      Name = "pro-vpc-prv"
    }
  }


output "vpc_id" {
    value = aws_vpc.pro-vpc.id
  }

output "security_group" {
    value = aws_security_group.pro-vpc-sg.id
  }

output "private_subnet_group" {
    value = aws_subnet.pro-vpc-prv
  }