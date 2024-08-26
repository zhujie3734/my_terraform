
module "rg" {
  source   = "./modules/rg"
  name     = var.rg_name
  location = var.rg_loc

}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = var.rg_name
  location            = var.rg_loc
  depends_on          = [module.rg]
}

module "sg" {
  source              = "./modules/sg"
  resource_group_name = var.rg_name
  location            = var.rg_loc
  subnet_id           = module.vnet.subnet_id
  depends_on          = [module.rg]
}

module "ecs" {
  source        = "./modules/ecs"
  name          = var.rg_name
  location      = var.rg_loc
  host_os       = var.host_os
  subnet_id     = module.vnet.subnet_id
  os_customdata = var.custom_data
  network_interface_ids = module.vnet.nic_id
  depends_on    = [module.rg]
  
}

#terraform apply -replace azurerm_linux_virtual_machine.jiezhu-vm can only replace vm resource


