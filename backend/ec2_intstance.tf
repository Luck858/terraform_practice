resource "aws_key_pair" "my-key" {
  key_name   = var.aws_key_pair.name
  public_key = file(var.aws_key_pair.key_path)

}



data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}


resource "aws_instance" "linux" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.aws_instance_info.instance_type
  subnet_id                   = aws_subnet.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]
  key_name                    = aws_key_pair.my-key.key_name
  associate_public_ip_address = true
  tags = {
    Name = var.aws_instance_info.name
  }
  lifecycle {
    create_before_destroy = true
  }

}


data "aws_vpc" "docker" {
  filter {
    name   = "tag:Name"
    values = ["docker"]
  }
}

