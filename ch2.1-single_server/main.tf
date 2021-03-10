provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "example" {
  ami           = "ami-096f43ef67d75e998"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
