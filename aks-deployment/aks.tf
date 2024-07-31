resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "avalon-${local.env}-k8s"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "avalon-${local.env}-k8s"

  linux_profile {
    admin_username = local.linux_profile_admin_user

    ssh_key {
      key_data = data.azurerm_key_vault_secret.avalon-ssh-public-key.value
    }
  }

  tags = local.tags

  default_node_pool {
    name                 = "agentpool"
    node_count           = local.aks_node_count
    vm_size              = local.aks_node_size
    os_sku               = "Ubuntu"
    os_disk_size_gb      = 64
    vnet_subnet_id       = azurerm_subnet.avalon_subnet.id
    orchestrator_version = local.aks_version
    upgrade_settings {
      max_surge = local.aks_upgrade_max_surge
    }
  }

  kubernetes_version = local.aks_version

  identity {
    type = "SystemAssigned"
  }
  role_based_access_control_enabled = "true"

  network_profile {
    network_plugin     = "kubenet"
    docker_bridge_cidr = "172.17.0.1/16"
    pod_cidr           = "10.241.0.0/16"
    service_cidr       = "10.240.0.0/16"
    dns_service_ip     = "10.240.0.10"
    load_balancer_sku  = "standard"
  }

  lifecycle {
    ignore_changes = [
      tags,
      api_server_authorized_ip_ranges
    ]
  }
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_subnet.avalon_subnet
  ]
}
