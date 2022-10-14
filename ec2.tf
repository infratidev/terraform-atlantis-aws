data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-10-amd64-20210208-542"]
  }

  owners = ["136693071363"] # Debian 10

}

resource "aws_instance" "web" {
  ami             = data.aws_ami.debian.id 
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg.id]
  instance_type   = var.instance_type

user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  sudo echo "<h1> Welcome to my terraform InfraTI IP: $(curl -s ifconfig.me) </h1>" | sudo tee "/var/www/html/index.html"
  echo "*** Completed Installing apache2"
  EOF

  volume_tags = {
    Name = "web_instance_infrati"
  } 

 tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform-infrati"
   }

}