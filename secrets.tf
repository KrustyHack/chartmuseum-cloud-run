# This secret must be created by hand before applying your Terraform state
data "google_secret_manager_secret_version" "chartmuseum-secret" {
  project = var.project_secret
  secret  = var.secret_name
}

locals {
  chartmuseum_secret = jsondecode(data.google_secret_manager_secret_version.chartmuseum-secret.secret_data)
}
