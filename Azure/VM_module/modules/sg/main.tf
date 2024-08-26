resource "azurerm_network_security_group" "jiezhu-sg" {
  name                = "jiezhu-sg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_security_rule" "jiezhu-rule" {
  name                        = "jiezhu-dev-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.jiezhu-sg.name
}

resource "azurerm_subnet_network_security_group_association" "jiezhu-asso" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.jiezhu-sg.id
}

