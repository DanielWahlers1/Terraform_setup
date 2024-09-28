##locals: Unterschied locals und Variable: Varibalen lassen sich von außen ansteuern, lokale Variablen würden sich nur durch CodeÄnderungen anpassen.
locals {
  google_project_id = "terraform-entwickleraustausch"
  tfc_organization_name = "Terraform_Entwickleraustausch"
  tfc_workspace_name = "Terraform_Entwickleraustausch"
}
 

/*

variable "project_id" {
    default = "DefaultValue, der überschrieben wird über dev.auto.tfvars"
    description = "The project id of the GCP project."
}

variable "tfc_organization_name" {
    default = "DefaultValue, der überschrieben wird über dev.auto.tfvars"
    description = "Name der Terraform Organisation."
}

variable "tfc_workspace_name" {
    default = "DefaultValue, der überschrieben wird über dev.auto.tfvars"
    description = "Name des Terraform Workspaces."
}

*/