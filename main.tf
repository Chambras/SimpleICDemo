terraform {
  backend "remote" {
    organization = "zambrana"

    workspaces {
      name = "BasicAzDemoEnv"
    }
  }
  required_version = "= 0.15.4"
  required_providers {
    azurerm = "= 2.60.0"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "genericRG" {
  name     = "${var.suffix}${var.rgName}"
  location = var.location
  tags     = var.tags
}
