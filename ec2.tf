resource "aws_instance" "public_servers" {
  #count = 3
  count = var.environment == "production" ? 3 : 1
  #ami                         = var.imagename
  #ami = lookup(map, key, default)  - Syntax
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-Public-Server-${count.index + 1}"
    Env        = var.environment
    Owner      = "owner"
    CostCenter = "ABCD"
  }

  user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt-get install -y nginx
      echo "<h1>"${var.vpc_name}-Public-Server-${count.index + 1}" </h1>" | sudo tee /var/www/html/index.nginx-debian.html
    EOF


}
