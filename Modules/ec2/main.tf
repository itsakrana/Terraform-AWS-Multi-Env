# Key Pair
resource "aws_key_pair" "this" {
  key_name   = "${var.env}-key"
  public_key = file(var.public_key_path)
}

# EC2 Instance
resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id              = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [var.sg_id]

  key_name = aws_key_pair.this.key_name

  user_data = file(var.user_data_path)

  tags = {
    Name = "${var.env}-ec2-${count.index}"
  }
}