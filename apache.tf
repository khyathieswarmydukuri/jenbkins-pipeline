resource "aws_instance" "apache-server" {
  ami           = "ami-01d87646ef267ccd7" 
  instance_type = "t2.micro"
  key_name =  aws_key_pair.pipeline-key.id
  subnet_id = "subnet-028267a65cdded142"
  vpc_security_group_ids = [aws_security_group.apache-sg.id]
user_data = <<EOF
    #! /bin/bash
yum update -y
yum install httpd
systemctl start httpd -y
systemctl enable httpd
systemctl status httpd

EOF
}
