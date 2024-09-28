provider "google" {
    project = local.google_project_id
    credentials = file("service_account_key.json")
}
