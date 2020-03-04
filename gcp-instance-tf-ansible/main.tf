# -------------------------------------------
# GCP Compute Instance Config
# -------------------------------------------

resource "google_compute_address" "webserver_ip" {
  name = "default"
  region = "${var.gcp_region}"
}


resource "google_compute_instance" "webserver_instance" {
  name         = "${var.instance_name}"
  machine_type = "${var.instance_type}"
  zone         = "${var.gcp_zone}"

  tags = ["webserver"]
  boot_disk {
    initialize_params {
      image = "${var.image_name}"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.webserver_ip.address}"
    }
  }
}

resource "google_compute_firewall" "ingress_rule" {
  name    = "ingress-webserver-firewall"
  network = "default"


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["49.206.126.253/32", "104.56.114.248/32"]
  target_tags = ["webserver"]
}
