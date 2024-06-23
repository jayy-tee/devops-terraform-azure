terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

module "shared" {
  source           = "../../../modules/shared-resources"
  location         = var.location
  environment_name = var.environment_name
}
