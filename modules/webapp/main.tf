terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

data "azurerm_service_plan" "shared-serviceplan" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
}
