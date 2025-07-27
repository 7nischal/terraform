provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "first_ec2" {
  ami           = "ami-08a6efd148b1f7504" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"

  tags = {
    Name = "EC2"
  }
}
