resource "azurerm_virtual_network" "jiezhu-vn" {
  name                = "jiezhu-network"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.121.0.0/16"]

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet" "jiezhu-subnet" {
  name                 = "jiezhu-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.jiezhu-vn.name
  address_prefixes     = ["10.121.0.0/24"]

}

resource "azurerm_public_ip" "jiezhu-ip" {
  name                = "zhujie-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  #domain_name_label = "app1-vm-${random_string.my_random.id}"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_interface" "jiezhu-nic" {
  name                = "jiezhu-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "jiezhuconfig"
    subnet_id                     = azurerm_subnet.jiezhu-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jiezhu-ip.id
  }

  tags = {
    environment = "dev"
  }
}

data "azurerm_public_ip" "jiezhu-ip-data" {
  name                = azurerm_public_ip.jiezhu-ip.name
  resource_group_name = var.resource_group_name

}

#output "public_ip_address" {
#  value       = "${var.vm_name}: ${data.azurerm_public_ip.jiezhu-ip-data.ip_address}"
#}