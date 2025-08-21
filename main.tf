# --- Security Group ---
resource "aws_security_group" "ec2_sg" {
  name        = "sasank-terraform"
  description = "Allow SSH, HTTP, and custom port 8080"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow custom port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- EC2 Instance ---
resource "aws_instance" "my_ec2" {
  ami           = "ami-044415bb13eee2391"   # 👈 Ubuntu in eu-west-2
  instance_type = "t2.micro"
  key_name      = "sasank-key"         # 👈 your existing key pair name

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Sasank-Instance"
  }
}

# --- Output Public IP ---
#output "instance_public_ip" {
 # value = aws_instance.my_ec2.public_ip
#}