data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20220912"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}
resource "aws_instance" "ec2_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  availability_zone      = "${var.availability_zone}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  subnet_id              = "${var.subnet_id}" 
  count                  = "${var.instance_count}" 
  tags = {
    Name        = "${var.environment}-${var.name}-${count.index}"
    Environment = "${var.environment}"
  }      
}