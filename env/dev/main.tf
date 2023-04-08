module "aws_dev" {
    source = "../../infra"
    instance = "t2.micro"
    region = "us-east-1"
    key = "dev"
    name_instance = "dev"
    geral_access = "access_dev"
}

output "public_ip_dev" {
    value = module.aws_dev.public_ip
}