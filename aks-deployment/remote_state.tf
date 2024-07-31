terraform {
  backend "azurerm" {
    resource_group_name     = "rg-subscription-automation-tf"                   # resource group where the storage account resides, normally 'rg-terraform-remote-state-prod-silver-centralus'
    storage_account_name    = "sgttfprodmanagedstor"                            # storage account that stores the terraform backend, (e.g. 'sasgrstfstate0017')
    container_name          = "tfstate"                                         # container that holds the blob, normally 'tfstate'
    key                     = "rg-8003-avalon-devops-sandbox.terraform.tfstate" # name of the blob for the teraform state file, (e.g.'backend-infra.terraform.tfstate')
    subscription_id         = "1bd1406c-a6e1-4379-aac9-1e4ed27a1fa8"            # sg2p-8003-Connected Production PROD-SENSIA-960
    tenant_id               = "27167de1-5481-4130-b8ff-0b34811b852e"
    client_id               = "CHANGE_CLIENT_ID"
    client_certificate_path = "CHANGE_CLIENT_CERTIFICATE_PATH"
  }
}
