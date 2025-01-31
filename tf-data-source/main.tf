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

data "aws_ami" "my-ami" {
    most_recent = true
    owners = ["aws-marketplace"]

}

output "aws_ami" {
    value = data.aws_ami.my-ami.id
  }

data "aws_security_groups" "sg" {
    tags = {
      Name = "Basic"
    }
  
}

output "security_group" {
    value = data.aws_security_groups.sg.ids
  }


resource "aws_instance" "test-tf" {
    ami = data.aws_ami.my-ami.id
    instance_type = "t2.micro"
    security_groups = data.aws_security_groups.sg.ids
  
  tags = {
    Name = "test"
  }
}