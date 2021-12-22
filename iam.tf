# Service account used by egress proxies VMs
resource "google_service_account" "service_account" {
  project      = var.project
  account_id   = "chartmuseum-cloud-run"
  display_name = "chartmuseum-cloud-run"
  description = "Service account used by Cloud Run service"
}

resource "google_storage_bucket_iam_member" "storage_object_admin" {
  bucket = google_storage_bucket.bucket.self_link
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.service_account.email}"
}
