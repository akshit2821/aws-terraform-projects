resource "aws_instance" "nginx-web" {
    ami = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-sub.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    key_name = "my ubuntu"

    user_data = <<-EOF
                   #!/bin/bash
                     sudo apt install nginx -y
                     sudo systemctl enable nginx --now
                   EOF  
  tags = {
    Name = "nginx-web"
  }
}