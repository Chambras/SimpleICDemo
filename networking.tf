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
