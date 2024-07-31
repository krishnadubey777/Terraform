data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "network_rg" {
  name = local.vnet_rg_name
}

data "azurerm_virtual_network" "network_vnet" {
  name                = local.vnet_name
  resource_group_name = data.azurerm_resource_group.network_rg.name
}

data "azurerm_resource_group" "rg_keyvault" {
  name = "rg-subscription-automation-tf"
}

data "azurerm_key_vault" "kv" {
  provider            = azurerm.ado_8003
  name                = "kv-sgt-prod-sub-auto"
  resource_group_name = data.azurerm_resource_group.rg_keyvault.name
}

data "azurerm_key_vault_secret" "avalon-ssh-public-key" {
  name         = "sg2p-avalon-prod-ssh-public-key"
  key_vault_id = data.azurerm_key_vault.kv.id
}

# data "azurerm_key_vault_secret" "secret_cluster_sp_client_id" {
#   name         = local.kv_avalon_aks-sp-client-id
#   key_vault_id = data.azurerm_key_vault.kv.id
# }

# data "azurerm_key_vault_secret" "secret_cluster_sp_client_secret" {
#   name         = local.kv_avalon_aks_sp_client_secret
#   key_vault_id = data.azurerm_key_vault.kv.id
# }





