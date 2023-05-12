resource "aws_instance" "test-ec2-terraform1" {
  ami                    = var.ami-id
  instance_type          = "t2.large"
  key_name               = "claveaws"
  vpc_security_group_ids = [aws_security_group.test-terraform-sg.id]
}
resource "aws_instance" "ec2-instance-web01" {
  ami                    = var.ami-id
  instance_type          = "t2.large"
  key_name               = "claveaws"
  vpc_security_group_ids = [aws_security_group.test-terraform-sg.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("/Users/maikool/downloads/claveaws.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd git",                                                             # -y lo que hace es no pedir confirmacion, instalo httpd y git
      "sudo systemctl start httpd",                                                                # arranco el servicio httpd
      "sudo git clone https://github.com/mauricioamendola/chaos-monkey-app.git /tmp/chaos-monkey", # clono el repo del profe
      "sudo mv /tmp/chaos-monkey/website/* /var/www/html"

    ]
  }
  tags = {
    Name = "ami-manera"
  }

}