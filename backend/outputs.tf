output "public_ip" {
  value = aws_instance.linux.public_ip

}
output "username" {
  value = var.aws_instance_info.username
}



output "connect_machine" {

  value = "ssh ${var.aws_instance_info.username}@${aws_instance.linux.public_ip}"

  ##value = format("ssh %s%s ", var.aws_instance_info.username,aws_instance.linux.public_ip) 
}