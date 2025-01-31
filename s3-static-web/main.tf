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

resource "random_id" "app" {
    byte_length = 6
  }

resource "aws_s3_bucket" "app" {
    bucket = "app-${random_id.app.hex}"  
}

resource "aws_s3_bucket_public_access_block" "app" {
  bucket = aws_s3_bucket.app.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "app" {
    bucket = aws_s3_bucket.app.id
    policy = jsonencode(
      {
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject",
            Resource = "arn:aws:s3:::${aws_s3_bucket.app.id}/*"
        }
    ]
}
    )
  
}

resource "aws_s3_bucket_website_configuration" "app" {
  bucket = aws_s3_bucket.app.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.app.bucket
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
  
}
resource "aws_s3_object" "style_css" {
    bucket = aws_s3_bucket.app.bucket
    source = "./style.css"
    key = "style.css"
    content_type = "text/css"
}

output "app" {
    value = aws_s3_bucket_website_configuration.app.website_endpoint
  }
