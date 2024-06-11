terraform {
  required_providers {
    aws = { source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_lightsail_instance" "custom2" {
  name              = "Dev_server"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  key_pair_name     = "Week2"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
  tags = {
    Team      = "DevOps"
    env       = "dev"
    create_by = "terraform"
  }
}
output "my-public-ip" {
  value = aws_lightsail_instance.custom2.public_ip_address
}

output "My_username" {
  value = aws_lightsail_instance.custom2.username
}

output "my_key" {
  value = aws_lightsail_instance.custom2.key_pair_name
}