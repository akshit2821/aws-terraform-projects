resource "aws_instance" "test-tf" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id = "subnet-0223f48ee7d41098d"
    key_name = "my ubuntu"
  
  tags = {
    Name = "test"
  }
}
  
