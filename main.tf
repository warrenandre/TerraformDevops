provider "azuredevops" {
  version = ">= 0.0.1"
  # Remember to specify the org service url and personal access token details below
  org_service_url = "https://dev.azure.com/wjoubert0382"
  personal_access_token = "__pat__"
}

variable "project_name" {
  default = "Sample Terraform Project"
}

variable "description" {
  default = "Sample Terraform Project"
}

variable "visibility" {
  default = "private"
}

variable "version_control" {
  default = "Git"
}

variable "work_item_template" {
  default = "Agile"
}
resource "azuredevops_project" "terraform_ado_project" {
  name               = var.project_name
  description        = var.description
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
  # Enable or desiable the DevOps fetures below (enabled / disabled)
  features = {
      "boards" = "enabled"
      "repositories" = "enabled"
      "pipelines" = "enabled"
      "testplans" = "enabled"
      "artifacts" = "enabled"
  }
}
