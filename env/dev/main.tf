module "aws_dev" {
    source = "../../infra"
    instance = "t2.micro"
    region = "us-east-1"
    key = "dev"
    name_instance = "dev"
    geral_access = "access_dev"
    user_data = <<-EOF
      #!/bin/bash
      cd home/ubuntu
      echo "<h1>Feito com terraform</h1>" > index.html
      nohup busybox httpd -f -p 8080 &
    EOF
}

output "public_ip_dev" {
    value = module.aws_dev.public_ip
}