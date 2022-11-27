# AMI
data "aws_ami" "main" {
  most_recent = true
  
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Security Group
resource "aws_security_group" "main" {
  name        = "SG-${var.project}"
  description = "${var.project}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Allow all for testing
    cidr_blocks = var.sg_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-${var.project}"
  }
}


# Instance
resource "aws_instance" "main" {
  ami                    = data.aws_ami.main.id
  instance_type          = "t3a.micro"
  vpc_security_group_ids = [aws_security_group.main.id]

  root_block_device {
    volume_size = "${var.size_volumen}"
    volume_type = "gp2"
  }

  tags = {
    Name = "Instance-${var.project}"
  }

  depends_on = [
    aws_security_group.main
  ]
}

# EIP
resource "aws_eip" "lb" {
  instance = aws_instance.main.id
  vpc      = true
  depends_on = [
    aws_instance.main,
    aws_security_group.main
  ]
}
