terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    cilium = {
      source  = "littlejo/cilium"
      version = ">=0.1.10"
    }
  }
  required_version = ">= 1.3"
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "cilium" {
  config_path = local_file.this.filename
}
