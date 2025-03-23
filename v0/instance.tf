resource "aws_instance" "web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  user_data = file("${path.module}/user-data.sh")
  tags = var.instance_tags
}