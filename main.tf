resource "aws_instance" "challenge01" {
  ami           =  var.ami
  instance_type =  var.instance
  key_name      =  "aws"

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = var.ansible_user
    private_key = file(var.private_key)
  }

}


resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.challenge01.id
  depends_on = [aws_instance.challenge01]

  provisioner "local-exec" {
    command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${aws_eip.ip.public_ip}', -u '${var.ansible_user}' --private-key '${var.private_key_aws_path}' ./master.yml"
  }

}




