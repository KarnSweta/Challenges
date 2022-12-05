resource "aws_db_instance" "aws_db" {
  allocated_storage      = "${var.allocated_storage}"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.id
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "${var.instance_class}"
  multi_az               = true
  name                   = "${var.environment}-db"
  username               = "${var.username}"
  password               = "${var.password}"
  skip_final_snapshot    = true
  vpc_security_group_ids = "${var.vpc_security_group_ids}"

resource "aws_db_subnet_group" "db_subnet" {
  name       = "main"
  subnet_ids = "${var.subnet_ids}"

  tags = {
    Name = "${environment}-db-subnet-group"
  }
}