/*resource "azurerm_public_ip" "winPublicIP" {
  name                = "${var.suffix}${var.winVMName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  allocation_method   = var.publicIPAllocation

  tags = var.tags
}

resource "azurerm_network_interface" "winNI" {
  name                = "${var.suffix}${var.winVMName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  ip_configuration {
    name                          = "windowsconfiguration"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.winPublicIP.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "winSG" {
  network_interface_id      = azurerm_network_interface.winNI.id
  network_security_group_id = azurerm_network_security_group.rdpNSG.id
}

resource "azurerm_windows_virtual_machine" "winVM" {
  name                  = "${var.suffix}${var.winVMName}"
  resource_group_name   = azurerm_resource_group.genericRG.name
  location              = azurerm_resource_group.genericRG.location
  size                  = var.vmSize
  admin_username        = var.devWinUserName
  admin_password        = var.windowsPassword
  network_interface_ids = [azurerm_network_interface.winNI.id, ]

  os_disk {
    name                 = "${var.suffix}${var.winVMName}OSDisk"
    caching              = "ReadWrite"
    storage_account_type = var.osDisk
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.windowsSKU
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.genericSA.primary_blob_endpoint
  }

  tags = var.tags
}
*/