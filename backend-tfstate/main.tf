terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  backend "s3" {
    bucket = "charizard-x-2525c9bf97f1"
    key = "backend-tfstate"
    region = "ap-south-1"
    
  }
}
provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "test-tf" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id = "subnet-0223f48ee7d41098d"
    key_name = "my ubuntu"
  
  tags = {
    Name = "test"
  }
}