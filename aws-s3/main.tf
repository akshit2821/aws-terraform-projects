terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "pokemon" {
  byte_length = 6
  
}

resource "aws_s3_bucket" "charizard-x" {
    bucket = "charizard-x-${random_id.pokemon.hex}"
}

resource "aws_s3_object" "test" {
    bucket = aws_s3_bucket.charizard-x.bucket
    source = "./main.tf"
    key = "main.tf"
}

output "pichu" {
  value = random_id.pokemon
  }