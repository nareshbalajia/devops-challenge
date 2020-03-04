# Terraform module for Deploying GCP GKE Cluster and Deploying Nginx Service

## How to run terraform code

- Set the GCP's service account JSON file location in provider.tf
- Run terraform init
- Run terraform plan -out=plan.out -var-file=<var-file.tfvars>
- Run terraform apply plan.out
