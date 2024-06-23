resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.resource_prefix}-webapp"
  resource_group_name = data.azurerm_service_plan.shared-serviceplan.resource_group_name
  service_plan_id     = data.azurerm_service_plan.shared-serviceplan.id
  location            = data.azurerm_service_plan.shared-serviceplan.location
  site_config {
    always_on = false
  }
}
