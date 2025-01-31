resource "aws_lb" "nginx-lb" {
    name = "nginx-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = ["sg-08fc5a973cf40a095"]
    subnets = ["subnet-0223f48ee7d41098d","subnet-0da66e6babf2b35b7"]

 tags = {
    Name = "nginx-lb"
  }
}

resource "aws_lb_listener" "nginx-listener" {
  load_balancer_arn = aws_lb.nginx-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "lb-attach" {
    target_group_arn = aws_lb_target_group.nginx-tg.arn
    target_id = aws_instance.nginx-web.id
    port = 80
  
}