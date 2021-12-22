resource "google_dns_record_set" "chartmuseum" {
  provider     = google-beta
  project      = var.project
  managed_zone = var.dns_managed_zone_name
  name         = "${var.dns_name}."
  type         = "CNAME"
  rrdatas      = ["ghs.googlehosted.com."]
  ttl          = 60
}
