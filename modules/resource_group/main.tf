resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  location = var.location
  tags     = var.tags
}
