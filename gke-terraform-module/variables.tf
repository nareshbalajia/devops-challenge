# ---------------
# Module variables
# ---------------

variable "project_name" {
  description = "The GCP project name"
}

variable "gcp_region" {
  description = "The GCP Region name"
}

variable "network_name" {
  description = "Name for VPC"
}

variable "subnet_name" {
  description = "Name for Subnet"
}

variable "subnet1_cidr_range" {
  description = "CIDR Range for Subnet"
}

variable "gke_cluster_name" {
  description = "GKE Cluster name"
}

variable "gke_node_pool_name" {
  description = "GKE Node pool name"
}
