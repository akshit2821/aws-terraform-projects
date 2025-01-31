output "instance_public_ip" {
    description = "This is public ip"
    value = aws_instance.nginx-web.public_ip
  }

  output "instance_url" {
    description = "URL access of NGINX server"
    value = "http://${aws_instance.nginx-web.public_ip}"
  }