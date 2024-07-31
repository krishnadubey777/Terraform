#Create Resource Group for the Network
resource "azurerm_resource_group" "rg" {
  location = local.location
  name     = local.aks_rg_name
  tags     = local.tags
}

resource "azurerm_subnet" "avalon_subnet" {
  name                 = "avalon-${local.env}-subnet"
  resource_group_name  = data.azurerm_resource_group.network_rg.name
  virtual_network_name = data.azurerm_virtual_network.network_vnet.name
  address_prefixes     = [local.aks_subnet_cidr]
}
