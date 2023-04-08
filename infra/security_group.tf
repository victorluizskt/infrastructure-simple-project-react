resource "aws_security_group" "geral_access" {
  name = var.geral_access
  description = "dev group"
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  tags = {
    Name = "geral_access_env"
  }
}