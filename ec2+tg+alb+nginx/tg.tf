resource "aws_lb_target_group" "nginx-tg" {
     name     = "nginx-tg"
     port     = 80
     protocol = "HTTP"
     vpc_id = "vpc-02239df5d65939d6d"

      health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "nginx-tg"
  }
}

 
