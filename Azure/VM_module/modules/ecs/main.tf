resource "azurerm_linux_virtual_machine" "jiezhu-vm" {
  name                = "jiezhu-vm"
  resource_group_name = var.name
  location            = var.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = var.network_interface_ids

  custom_data = filebase64("${path.module}/${var.os_customdata == "redhat" ? "customdata_rhel.tpl" : "customdata_ubuntu.tpl"}")


  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/jiezhuazurekey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }

  provisioner "local-exec" {
    command = templatefile("${path.module}/ssh-${var.host_os}-script.tpl", {
      hostname     = self.public_ip_address,
      user         = "adminuser",
      identityfile = "~/.ssh/jiezhuazurekey"
    })
    interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }

  provisioner "local-exec" {
    when        = destroy
    command     = "Clear-Content c:/Users/lenovo/.ssh/config"
    interpreter = ["Powershell", "-Command"]
  }

  tags = {
    environment = "dev"
  }
}

