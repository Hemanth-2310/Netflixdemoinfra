provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0cae6d6fe6048ca2c"
  instance_type          = "t3.micro"
  key_name               = "saikeypair"
  vpc_security_group_ids = ["sg-0180a974800b1093d"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
