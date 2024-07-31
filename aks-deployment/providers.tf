terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.80.0" # Optional but recommended in production
    }
  }
}

provider "azurerm" {
  features {}
  #client_secret = local.client_secret
  subscription_id         = local.subscription_id
  client_id               = local.client_id
  client_certificate_path = local.client_certificate_path
  tenant_id               = local.tenant_id
}

provider "azurerm" {
  features {}
  alias                   = "ado_8003"
  subscription_id         = local.subscription_id
  client_id               = local.client_id
  client_certificate_path = local.client_certificate_path
  tenant_id               = local.tenant_id
}
