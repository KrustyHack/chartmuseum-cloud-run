variable "project" {
  description = "GCP project"
  default     = "YOURPROJECT"
}
variable "zone" {
  description = "GCP zone"
  default     = "europe-west1-d"
}
variable "region" {
  description = "GCP region"
  default     = "europe-west1"
}
variable "chartmuseum_docker_image" {
  description = "Docker image to deploy"
  default     = "europe-west1-docker.pkg.dev/YOURPROJECT/docker-public/chartmuseum:xxx"
}
variable "bucket_name" {
  description = "Name of the bucket where to store charts"
  default     = "MYBUCKET"
}
variable "dns_managed_zone_name" {
  description = "DNS zone name where to setup Cloud Run custom domain"
  default     = "MYZONE"
}
variable "dns_name" {
  description = "Custom domain to service Cloud Run service"
  default     = "myservice.mydomain.com"
}
variable "project_secret" {
  description = "Project where to lookup for secret injected in Cloud Run container"
  default     = "YOURPROJECT"
}
variable "secret_name" {
  description = "Name of the secret to lookup and inject in Cloud Run container"
  default     = "MYSECRET"
}
