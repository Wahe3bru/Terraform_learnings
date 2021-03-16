terraform {
  backend "s3" {
    bucket = "terraform_learning_state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "terraform-learning-locks"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database"
  username = "admin"
  # never store passwords in plain text
  password = var.db_password
}
