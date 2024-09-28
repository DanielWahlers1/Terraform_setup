#Kann man auch theoretisch auslagern in einen eigenen Workspace
#Siehe auch https://www.hashicorp.com/blog/access-google-cloud-from-hcp-terraform-with-workload-identity

# create a workload identity pool for HCP Terraform
resource "google_iam_workload_identity_pool" "hcp_tf" {
  project                   = local.google_project_id
  workload_identity_pool_id = "hcp-tf-pool"
  display_name              = "HCP Terraform Pool"
  description               = "Used to authenticate to Google Cloud"
}
  
# create a workload identity pool provider for HCP Terraform
resource "google_iam_workload_identity_pool_provider" "hcp_tf" {
  project                            = local.google_project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.hcp_tf.workload_identity_pool_id
  workload_identity_pool_provider_id = "hcp-tf-provider"
  display_name                       = "HCP Terraform Provider"
  description                        = "Used to authenticate to Google Cloud"
  attribute_condition                = "assertion.terraform_organization_name==\"${local.tfc_organization_name}\""
  attribute_mapping = {
    "google.subject"                     = "assertion.sub"
    "attribute.terraform_workspace_id"   = "assertion.terraform_workspace_id"
    "attribute.terraform_full_workspace" = "assertion.terraform_full_workspace"
  }
  oidc {
    issuer_uri = "https://app.terraform.io"
  }
} 