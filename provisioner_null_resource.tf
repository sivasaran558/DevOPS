resource "null_resource" "file-remote-local" {

  count = var.environment == "production" ? 3 : 1

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("Siva_AWS_terraform.pem")
      host        = element(aws_instance.public_servers.*.public_ip, count.index)
    }

  }

  provisioner "remote-exec" {
    inline = [
      "sleep 30",
      "sudo chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update",
      "sudo apt install jq unzip -y",
      #"sudo sed -i '/<h1>Testing Phase.*/a <h1>${var.vpc_name}-PublicServer-${count.index + 1}' /var/www/html/index.nginx-debian.html"
      "sudo sed -i 's/Testing Phase 1/${var.vpc_name}-PublicServer-${count.index}/g' /var/www/html/index.nginx-debian.html"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("Siva_AWS_terraform.pem")
      host        = element(aws_instance.public_servers.*.public_ip, count.index)
    }

  }

  provisioner "local-exec" {
    command = <<EOH
      echo "${element(aws_instance.public_servers.*.public_ip, count.index)}" >> public_server_details_1
      EOH

  }

}