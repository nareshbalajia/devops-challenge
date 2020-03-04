# -----------------------------------------------
# GCP VPC Config
# -----------------------------------------------

resource "google_compute_network" "self_learn_vpc" {
  name = "${var.network_name}"
  description = "VPC for Self-learning Experimentation"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "self_learn_public_subnet" {
  name = "${var.subnet_name}"
  ip_cidr_range = "${var.subnet1_cidr_range}"
  region = "${var.gcp_region}"
  network = "${google_compute_network.self_learn_vpc.self_link}"
}
