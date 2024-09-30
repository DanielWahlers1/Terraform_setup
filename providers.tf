provider "google" {
    project = local.google_project_id
    credentials = file("service_account_key.json")
}


terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.58.1"
    }
  }
}

provider "tfe" { 
  # Configuration options 
}