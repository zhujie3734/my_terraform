
module "resource_group" {
    source = ../../modules/resource_group
    client_name = var.client_name
    project_name = var.project_name
}

module "vnet" {
    source = ../../modules/vnet
    client_name = var.client_name
    project_name = var.project_name
    resource_group_location = module.resource_group.resource_group_location
    resource_group_name =module.resource_group.resource_group_name
    create_firewall = false
}

module "storage" {
    source = ../../modules/storage
    client_name = var.client_name
    project_name = var.project_name
    resource_group_location = module.resource_group.resource_group_location
    resource_group_name =module.resource_group.resource_group_name
    network_rules_subnet_ids = [
        module.vnet.vm_subnet_id
        module.vnet.aks_subnet_id
    ]
}
