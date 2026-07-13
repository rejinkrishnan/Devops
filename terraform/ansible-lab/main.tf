resource "aws_default_vpc" "default" {}

resource "aws_security_group" "ansible_lab_sg" {
  name_prefix = "ansible-lab"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_default_vpc.default.id
}

resource "aws_instance" "ansible_control" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t3.micro"
  key_name               = "ansible-lab-key"
  vpc_security_group_ids = [aws_security_group.ansible_lab_sg.id]

  tags = {
    Name = "ansible-control"
  }
}

resource "aws_instance" "ansible_managed" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t3.micro"
  key_name               = "ansible-lab-key"
  vpc_security_group_ids = [aws_security_group.ansible_lab_sg.id]

  tags = {
    Name = "ansible-managed"
  }
}
