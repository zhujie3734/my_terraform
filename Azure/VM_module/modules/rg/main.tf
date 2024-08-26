resource "azurerm_resource_group" "jiezhu-rg" {
  name     = var.name
  location = var.location
  tags = {
    environment = "dev"
  }
}