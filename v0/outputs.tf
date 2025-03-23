output "public_ip" {
  description = "The public IP address of the web server"
  value = aws_instance.web-server.public_ip
}