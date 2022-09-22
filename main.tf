

variables:
  - group: DEV

variables:
  buildConfiguration: 'Release'
  location: 'westus'
  resource_group_name: 'terraform-rg'
  resource_group_location: 'westus'
  terraformstorageaccount: 'tfstoragewj'
  storagekey: 'PipelineWillGetThisValueRuntime'
  app_service_name: 'tailspin-wj'
  project_name:'Sample Terraform Project'
  description:'Sample Azure DevOps Project Created Using Terraform'
  visibility:'private'
  version_control:'Git'
  work_item_template:'Agile'


provider "azuredevops" {
  version = ">= 0.0.1"
  # Remember to specify the org service url and personal access token details below
  org_service_url = "https://dev.azure.com/wjoubert0382"
  personal_access_token = $(PAT)
}


resource "azuredevops_project" "terraform_ado_project" {
  project_name       = var.project_name
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
