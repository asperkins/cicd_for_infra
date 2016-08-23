resource "digitalocean_droplet" "www-2" {
  image = "ubuntu-16-04-x64"
  name = "www-2"
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
}