data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.chartmuseum.location
  project  = google_cloud_run_service.chartmuseum.project
  service  = google_cloud_run_service.chartmuseum.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_cloud_run_domain_mapping" "chartmuseum" {
  location = "europe-west1"
  name     = var.dns_name

  metadata {
    namespace = var.project
  }

  spec {
    route_name = google_cloud_run_service.chartmuseum.name
  }
}

resource "google_cloud_run_service" "chartmuseum" {
  name                       = "chartmuseum"
  location                   = var.region
  autogenerate_revision_name = true



  template {
    spec {
      service_account_name = google_service_account.service_account.email
      timeout_seconds      = "60"
      containers {
        image = var.chartmuseum_docker_image
        resources {
          limits = {
            cpu    = "1000m"
            memory = "256Mi"
          }
        }
        env {
          name  = "ALLOW_OVERWRITE"
          value = "true"
        }
        env {
          name  = "DISABLE_METRICS"
          value = "true"
        }
        env {
          name  = "LOG_JSON"
          value = "true"
        }
        env {
          name  = "STORAGE"
          value = "google"
        }
        env {
          name  = "STORAGE_GOOGLE_BUCKET"
          value = var.bucket_name
        }
        env {
          name  = "BASIC_AUTH_USER"
          value = local.chartmuseum_secret.chartmuseum_user
        }
        env {
          name  = "BASIC_AUTH_PASS"
          value = local.chartmuseum_secret.chartmuseum_password
        }
        env {
          name  = "DISABLE_STATEFILES"
          value = "true"
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
