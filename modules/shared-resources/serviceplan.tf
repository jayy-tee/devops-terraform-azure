locals {
  resource_prefix = "examplestack-${var.environment_name}"
}

resource "azurerm_service_plan" "testplan" {
    name = "${local.resource_prefix}"
    resource_group_name = azurerm_resource_group.shared-rg.name
    location = azurerm_resource_group.shared-rg.location
    os_type = "Linux"
    sku_name = "F1"
}