/*Benötigt einen eigenen Provider */

/*
# create a variable set to store the workload identity federation config for the 'example' service account
resource "tfe_variable_set" "hcp-tf-variable-set" {
  name         = google_service_account.sa-hcp-tf.name
  description  = "Workload identity federation configuration for ${google_service_account.sa-hcp-tf.name}"
  organization = local.organization_name
}

# share the variable set with another HCP Terraform Workspace
resource "tfe_workspace_variable_set" "example" {
  variable_set_id = tfe_variable_set.hcp-tf-variable-set.id
  workspace_id    = "Terraform_Entwickleraustausch"
}

resource "tfe_variable" "hcp-tf-provider-auth" {
  key             = "TFC_GCP_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  variable_set_id = tfe_variable_set.hcp-tf-variable-set.id
}
 
resource "tfe_variable" "hcp-tf-provider-service-account-email" {
  sensitive       = true
  key             = "TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL"
  value           = google_service_account.sa-hcp-tf.name
  category        = "env"
  variable_set_id = tfe_variable_set.hcp-tf-variable-set.id
}
 
resource "tfe_variable" "hcp-tf-provider-provider-name" {
  sensitive       = true
  key             = "TFC_GCP_WORKLOAD_PROVIDER_NAME"
  value           = google_iam_workload_identity_pool_provider.hcp_tf.name
  category        = "env"
  variable_set_id = tfe_variable_set.hcp-tf-variable-set.id
}


*/