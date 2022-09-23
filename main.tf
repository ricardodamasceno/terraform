provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
    # Amount of instances that will be created
    count = 0
    ami = "ami-08c40ec9ead489470"
    instance_type = "t2.micro"
    key_name = "tf-admin"
    tags = {
        # Name of each instance
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["sg-09f7097d38a092e3b"]
}

resource "aws_security_group" "acesso-ssh" {
    
  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["179.73.245.249/32"]
  }

  tags = {
    "Name" = "ssh"
  }

}