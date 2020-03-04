# -----------------------------------------
# Google Kubernetes Engine definition
# ------------------------------------------

resource "google_container_cluster" "self_learn_gke" {
  name = "${var.gke_cluster_name}"
  location = "${var.gcp_region}"
  remove_default_node_pool = true
  initial_node_count = 1
  network = "${google_compute_network.self_learn_vpc.name}"
  subnetwork = "${google_compute_subnetwork.self_learn_public_subnet.name}"
}

resource "google_container_node_pool" "self_learn_gke_node_group" {
  name = "${var.gke_node_pool_name}"
  location = "${var.gcp_region}"
  cluster = "${google_container_cluster.self_learn_gke.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
