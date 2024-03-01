output "rgName" {
  value = azurerm_resource_group.genericRG.name
}

# Network
output "vNet" {
  value = local.base_cidr_block
}

output "mainSubnet" {
  value = azurerm_subnet.main.address_prefixes
}

output "appSubnet" {
  value = azurerm_subnet.app.address_prefixes
}

# Windows VM
output "windowsPublicIP" {
  value = azurerm_public_ip.winPublicIP.ip_address
}

output "windowsPrivateIP" {
  value = azurerm_network_interface.winNI.private_ip_address
}

output "windowsUserName" {
  value = var.devWinUserName
}

# RedHat VM
output "devRHPublicIP" {
  value = azurerm_public_ip.devRHPublicIP.ip_address
}

output "devRHPrivateIP" {
  value = azurerm_network_interface.devRHNI.private_ip_address
}

output "sshAccess" {
  description = "Command to ssh into the VM."
  value       = <<SSHCONFIG
  ssh ${var.devRHUserName}@${azurerm_public_ip.devRHPublicIP.ip_address} -i ~/.ssh/vm_ssh
  SSHCONFIG
}

