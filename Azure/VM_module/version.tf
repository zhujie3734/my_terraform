terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }

  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "my_random" {
  length  = 6
  upper   = false
  special = false
  numeric  = false
}

