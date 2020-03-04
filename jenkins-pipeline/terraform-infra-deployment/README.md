# Jenkins Pipeline for terraform infra deployment

## Pipeline Flow

- Checks out Terraform code repo
- Installs Terraform executable
- Runs terraform init, validate, plan and sends a Slack message for plan approval
- Once approved, Infra will be deployed
