resource "aws_instance" "jenkins-server" {
  ami           = "ami-01d87646ef267ccd7" 
  instance_type = "c5.large"
  subnet_id = "subnet-028267a65cdded142"
  key_name =  aws_key_pair.pipeline-key.id
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
    user_data = <<EOF
    #! /bin/bash
    wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
    yum upgrade -y
    amazon-linux-extras install java-openjdk11
    yum install jenkins -y
    systemctl enable jenkins
    systemctl start jenkins 
    

EOF

}
