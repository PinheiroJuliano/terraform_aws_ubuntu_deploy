provider "aws" {
  region = "us-west-2"
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"
  public_key = file("C:/Users/Juliano/.ssh/id_rsa.pub")
}

resource "aws_instance" "ubuntu_server" {
  ami           = "ami-0f2175c525a037449" # ID da AMI Ubuntu 20.04 LTS para us-west-2
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name

  tags = {
    Name = "UbuntuServer"
  }
}

output "instance_ip" {
  value = aws_instance.ubuntu_server.public_ip
}
