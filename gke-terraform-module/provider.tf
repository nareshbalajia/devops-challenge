# ---------------------------------
# Google Cloud provider
# ---------------------------------

provider "google" {
  credentials = "${file("/home/naresh/google-cloud-keys/gcp-self.json")}"
  project = "${var.project_name}"
  region = "${var.gcp_region}"
}
