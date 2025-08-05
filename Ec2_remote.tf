#Create an EC2 instance with Nginx installed using Terraform
#Ensure you have the AWS CLI configured with your credentials

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "myec2" {
  ami           = "ami-04e5276ebb8451442" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name = "terraform-key"
  vpc_security_group_ids = ["sg-0d4bd9dba83641f86"] 

connection {
   type = "ssh"
   user = "ec2-user"
   private_key = file("./terraform-key.pem")
   host = self.public_ip
}

provisioner "remote-exec" {
  inline = [
    "sudo yum -y install nginx",
    "sudo systemctl start nginx",
  ]
}
}
