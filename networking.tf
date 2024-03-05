## Create Network
resource "azurerm_virtual_network" "genericVNet" {
  name                = "${var.suffix}-${var.vnetName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  address_space       = [local.base_cidr_block]

  tags = var.tags
}

# Main Subnet for DCs and other utility servers
resource "azurerm_subnet" "main" {
  name                 = "demo-dev-main"
  resource_group_name  = azurerm_resource_group.genericRG.name
  virtual_network_name = azurerm_virtual_network.genericVNet.name
  # address_prefix       = 10.60.0.0/28"
  address_prefixes = [cidrsubnet(local.base_cidr_block, 12, 0)]

  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "app" {
  name                 = "demo-dev-app"
  resource_group_name  = azurerm_resource_group.genericRG.name
  virtual_network_name = azurerm_virtual_network.genericVNet.name
  # address_prefix       = "10.60.0.16/28"
  address_prefixes = [cidrsubnet(local.base_cidr_block, 12, 1)]

  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_virtual_network" "genericVNet2" {
  name                = "${var.suffix}-${var.vnetName}2"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  address_space       = [local.base_cidr_block2]

  subnet {
    name           = "subnet1"
    address_prefix = "10.70.0.0/28"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.70.0.16/28"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.70.0.32/28"
  }

  tags = var.tags
}
