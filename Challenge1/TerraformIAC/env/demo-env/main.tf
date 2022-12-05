# Create a VPC
module "network" {
  source = "../modules/VPC"
  vpc_cidr = "10.0.0.0/16"
  environment = "demo"
  public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets_cidr = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# Create Web Security Group
resource "aws_security_group" "web-sg" {
  name        = "Web-SG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-SG"
  }
}

# Create Application Security Group
resource "aws_security_group" "application-sg" {
  name        = "Application-SG"
  description = "Allow inbound traffic from ALB"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    description     = "Allow traffic from web layer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Application-SG"
  }
}

# Create Database Security Group
resource "aws_security_group" "database-sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.application-sg.id]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database-SG"
  }
}

#Create EC2 Instance - webserver
module "webserver" {
  source = "../modules/ec2"
  ami                    = "ami-0d5eff06f840b45e9"  #can also get latest ami from name filter
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = "${module.network.public_subnet_id}"
  
  count                  = 1
  name                   = "webserver"
  environment            = "demo"
}

#Create EC2 Instance - application
module "application" {
  source = "../modules/ec2"
  ami                    = "ami-0d5eff06f840b45d0"   #can also get latest ami from name filter
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.application-sg.id]
  subnet_id              = "${module.network.private_subnet_id}"
  count                  = 1
  name                   = "application"
  environment            = "demo"
}

# create loadbalancer
resource "aws_lb" "external-elb" {
  name               = "${var.environment}-External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = "${module.network.public_subnet_id}"
}

resource "aws_lb_target_group" "external-elb" {
  name     = "${var.environment}-ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${module.network.vpc_id}"
}

resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = "${module.webserver.ec2_id}"
  port             = 80
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}

module "demo-db" {
  source = "../modules/db_instance"
  allocated_storage      = 10
  instance_class         = "db.t2.micro"
  username               = "${var.username}"
  password               = "$var.password}"
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  subnet_ids = "${module.network.private_subnet_id}"
}
