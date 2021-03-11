provider "aws" {
  region = "eu-west-1"
}

variable "server_port" {
  description = ""
  type        = number
  default     = 8080
}
resource "aws_instance" "webserver" {
  ami                    = "ami-08bac620dc84221eb"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "terraform-config-webserver"
  }
}

output "public_ip" {
  description = "public ip of the webserver"
  value       = aws_instance.webserver.public_ip
}
resource "aws_security_group" "instance" {
  name = "terraform-config-webserver-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
