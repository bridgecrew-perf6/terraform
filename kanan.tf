provider "aws" {
  region     = "us-east-1"
}

terraform {
   backend "s3" {
      bucket = "terraformbucket31"  
      key    = "gitaction/terraform.tfstate"
      region = "us-east-1"
   }
}




resource "aws_instance" "testucun" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "salamkey" 
  user_data = <<EOF
#!/bin/bash
apt update -y
apt install apache2 -y
EOF
}
