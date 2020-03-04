# ---------------------------------
# Google Cloud provider
# ---------------------------------

provider "google" {
  credentials = "${file("key.json")}"
  project = "${var.project_name}"
  region = "${var.gcp_region}"
}
