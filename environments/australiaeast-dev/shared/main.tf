terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "jt-tfstate-rg"
    storage_account_name = "jttfstatestorage"
    container_name       = "tfstate-dev"
    key                  = "australiaeast-dev/shared.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "shared" {
  source           = "../../../modules/shared-resources"
  location         = var.location
  environment_name = var.environment_name
}
