locals {
  # Keyvault Vars
  key_vault_id                   = "kv-8002-ado-sp"
  key_vault_rg                   = "rg-8002-tf-ado-eastus"
  kv_aks_nodes_public_key        = "aks-nodes-public-key"
  kv_avalon_aks-sp-client-id     = "avalon-perf-aks-sp-client-id"
  kv_avalon_aks_sp_client_secret = "avalon-perf-aks-sp-client-secret"

  # Azurerm Vars will be populated using azure pipelines
  subscription_id         = "1bd1406c-a6e1-4379-aac9-1e4ed27a1fa8" # sg2p-8003-Connected Production PROD-SENSIA-960
  tenant_id               = "27167de1-5481-4130-b8ff-0b34811b852e"
  client_id               = var.client_id
  client_certificate_path = var.client_certificate_path


  tags = {
    DeployedBy         = "Avalon-ADO-AppDev"
    ServiceClass       = "User Managed"
    OwnerEmail         = "dattatray.belkar@sensiaglobal.com"
    Lifespan           = "years"
    ITManaged          = "false"
    Environment        = "Dev"
    CostCenter         = "122001"
    ApplicationName    = "Avalon Devops Cluster"
    BusinessUnit       = "TECH"
    CostCenter         = "122001"
    DataClassification = "internal"
    ProjectInitiative  = "Avalon"
    ServiceClass       = "Bronze"
    TFManagedRepoPath  = "Avalon/Devops/terraform"
  }
  # AKS Vars
  aks_rg_name              = "rg-8003-avalon-devops-sandbox"
  vnet_rg_name             = "rg-8003-network-westeurope"
  vnet_name                = "vnet-8003-westeurope"
  env                      = "devops-sandbox"
  aks_node_count           = "8"
  aks_version              = "1.28.9"
  location                 = "westeurope"
  sub_number               = "8003"
  aks_subnet_cidr          = "192.168.13.0/26"
  aks_upgrade_max_surge    = "33%"
  aks_node_size            = "Standard_E4s_v5"
  linux_profile_admin_user = "mando"
}
