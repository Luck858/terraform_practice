resource "aws_key_pair" "my-key" {
  key_name   = var.aws_key_pair.name
  public_key = file(var.aws_key_pair.key_path)

}

resource "aws_instance" "linux" {
  ami                         = var.aws_instance_info.ami_id
  instance_type               = var.aws_instance_info.instance_type
  subnet_id                   = aws_subnet.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]
  key_name                    = aws_key_pair.my-key.key_name
  associate_public_ip_address = true
  tags = {
    Name = var.aws_instance_info.name
  }

}