terraform {
  cloud {
    organization = "zambrana"

    workspaces {
      name = "BasicAzDemoEnv"
    }
  }
  required_version = "= 1.7.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.94.0"
    }

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
