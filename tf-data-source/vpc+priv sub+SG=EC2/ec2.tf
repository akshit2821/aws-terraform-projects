resource "aws_instance" "pro-vpc-ec2" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pro-vpc-prv.id
    vpc_security_group_ids = [aws_security_group.pro-vpc-sg.id]
    key_name = "my ubuntu"

    tags = {
      Name = "pro-vpc-ec2"
    }
  
}