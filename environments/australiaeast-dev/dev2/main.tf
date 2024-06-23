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

locals {
  resource_prefix = "examplestack-${data.azurerm_resource_group.rg.location}-${var.environment_name}"
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "webapp" {
  source              = "../../../modules/webapp"
  service_plan_name   = var.service_plan_name
  resource_group_name = var.resource_group_name
  resource_prefix     = local.resource_prefix
}
