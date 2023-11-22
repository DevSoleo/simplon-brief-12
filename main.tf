terraform {
 required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "main" {
  source = "git::https://github.com/DevSoleo/simplon-brief-12-module"
  
  resource_group_name = "rg-brief12-aks"
  location            = "francecentral"

  vnet_name           = "myvnet"
  address_space       = ["10.6.0.0/16"]
  subnet_name        = "mysubnet"
  subnet_prefix      = ["10.6.1.0/24"]

  vm_size             = "Standard_D2_v2"

  aks_name            = "mycluster"
  dns_prefix          = "aks-dns"
  pool_name           = "akspool"
  node_count          = 3
}
