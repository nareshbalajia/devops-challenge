# DevOps Challenge Terraform and Ansible resources

This folder contains the Terraform and Ansible resources for deploying infra on GCP

## Contents

- [gke-terraform-module](./gke-terraform-module): This is the Terraform module which Deployed a Kubernetes Engine on GCP and deployed a Nginx as a LoadBalancer exposed Service

- [gcp-instance-tf-ansible](./gcp-instance-tf-ansible): This is the Terraform module and Ansible playbook which deploys a f1 micro instance and installs Nginx and Passenger onto it

- [jenkins-pipeline](./jenkins-pipeline): Two Jenkins pipeline which will build a Android App for dev release, another pipeline for Terraform VPC Deployment
