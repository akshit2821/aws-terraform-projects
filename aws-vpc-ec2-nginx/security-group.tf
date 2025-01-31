resource "aws_security_group" "nginx-sg" {

    vpc_id = aws_vpc.my-vpc.id

    #Inbound Rule   
    ingress  {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
     
     #Outbound Rule
     egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

      tags = {
        Name = "nginx-sg"
      }
}