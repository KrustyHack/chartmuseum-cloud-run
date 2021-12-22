resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  project       = var.project
  location      = "EU"
  force_destroy = false

  uniform_bucket_level_access = true
}
