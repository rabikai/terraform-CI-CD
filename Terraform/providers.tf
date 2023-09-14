terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "my_terraform_lab"
  #   workspaces {
  #     name = "TerraformCI"
  #   }
  # }
  backend "azurerm" {
    resource_group_name  = "inviting-shrew"
    storage_account_name = "sprixystg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}