# example service account that HCP Terraform will impersonate
resource "google_service_account" "sa-hcp-tf" {
  account_id   = "sa-hcp-terraform"
  display_name = "Service Account for HCP Terraform"
  project      = local.google_project_id
}

# IAM verifies the HCP Terraform Workspace ID before authorizing access to impersonate the 'example' service account
resource "google_service_account_iam_member" "example_workload_identity_user" {
  service_account_id = google_service_account.sa-hcp-tf.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.hcp_tf.name}/attribute.terraform_workspace_id/ws-s5GxjAemWFtzfwNV"
}
 


# grant 'example' service account permissions to create a bucket
resource "google_project_iam_member" "example_editor_admin" {
  member  = "serviceAccount:${google_service_account.sa-hcp-tf.email}"
  role    = "roles/owner"
  project = local.google_project_id
}


//assertion.terraform_organization_name=="Terraform_Entwickleraustausch"