locals {
  group_name = "examplestack-${var.environment_name}-rg"
}

resource "azurerm_resource_group" "shared-rg" {
  name     = local.group_name
  location = var.location
}
