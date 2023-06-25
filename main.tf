# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}

  subscription_id = "4b9c23f1-02d5-4863-9c82-9fa1098c566d"

}

resource "azurerm_resource_group" "rg" {
  name     = "pkaan_terraform_group"
  location = "eastus2"
  tags = {
    environment = "sbx"
    platform    = "Terraform"
  }
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asp-pkaan-terraform"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "F1"
}
