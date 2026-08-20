provider "google-beta" {
  project = var.google_project_id
}

resource "google_project_service" "firebase" {
  provider           = google-beta
  project            = var.google_project_id
  service            = "firebase.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "firestore" {
  provider           = google-beta
  project            = var.google_project_id
  service            = "firestore.googleapis.com"
  disable_on_destroy = false
}

resource "google_firebase_project" "application" {
  provider = google-beta
  project  = var.google_project_id

  depends_on = [google_project_service.firebase]

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_firestore_database" "default" {
  provider                    = google-beta
  project                     = var.google_project_id
  name                        = "(default)"
  location_id                 = var.firestore_location
  type                        = "FIRESTORE_NATIVE"
  deletion_policy             = "ABANDON"
  delete_protection_state     = "DELETE_PROTECTION_ENABLED"
  app_engine_integration_mode = "DISABLED"

  depends_on = [
    google_firebase_project.application,
    google_project_service.firestore,
  ]
}

output "firebase_project_id" {
  description = "Firebase Console で利用するプロジェクト ID"
  value       = google_firebase_project.application.project
}

output "firestore_database" {
  description = "作成した Firestore データベース名"
  value       = google_firestore_database.default.name
}
