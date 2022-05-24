resource "aws_instance" "web-1" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-Server-1"
    Env        = var.environment
    Owner      = "owner"
    CostCenter = "ABCD"
  }

  user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx stress jq
        sudo service nginx start
        echo "<center><h1> $(cat /etc/hostname)</h1></center>" | sudo tee /var/www/html/index.html
    EOF

  lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
    #ignore_changes = [tags]   ignore_changes are used to ignore any kind of resource changes that are beng controlled by terraform but the changes are made manually in AWS. 
    #In this case, terraform plan or terraform apply will ignore any changes that are made for resource tags
  }

}