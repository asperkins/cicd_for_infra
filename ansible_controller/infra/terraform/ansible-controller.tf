resource "digitalocean_droplet" "tower" {
  image = "ubuntu-16-04-x64"
  name = "tower"
  region = "nyc2"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
    ]
  connection {
    user = "root"
    type = "ssh"
    key_file = "${var.pvt_key}"
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install ansible
      "sudo apt-get update",
      "sudo apt-get -y install ansible"
    ]
  }
}
# Create a new SSH key
resource "digitalocean_ssh_key" "ansible" {
  name = "Ansible Key"
  public_key = "${var.pub_key}"
}


