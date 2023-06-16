# Get the current client configuration from the AzureRM provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.60.0"
    }
  }
}

# Define the provider configuration

provider "azurerm" {
  features {}
}
data "azurerm_client_config" "core" {
    provider = azurerm
}

# Logic to handle 1-3 platform subscriptions as available

locals {
  subscription_id_connectivity = var.subscription_id_connectivity
  subscription_id_identity     = var.subscription_id_identity
  subscription_id_management   = var.subscription_id_management
}

# The following module declarations act to orchestrate the
# independently defined module instances for core,
# connectivity and management resources

module "connectivity" {
  source = "../modules/connectivity"

  connectivity_resources_tags  = var.connectivity_resources_tags
  enable_ddos_protection       = var.enable_ddos_protection
  primary_location             = var.primary_location
  root_id                      = var.root_id
  secondary_location           = var.secondary_location
  subscription_id_connectivity = local.subscription_id_connectivity
}

module "management" {
  source = "../modules/management"

  email_security_contact     = var.email_security_contact
  log_retention_in_days      = var.log_retention_in_days
  management_resources_tags  = var.management_resources_tags
  primary_location           = var.primary_location
  root_id                    = var.root_id
  subscription_id_management = local.subscription_id_management
}

module "core" {
  source = "../modules/core"

  configure_connectivity_resources = module.connectivity.configuration
  configure_management_resources   = module.management.configuration
  primary_location                 = var.primary_location
  root_id                          = var.root_id
  root_name                        = var.root_name
  secondary_location               = var.secondary_location
  subscription_id_connectivity     = local.subscription_id_connectivity
  subscription_id_identity         = local.subscription_id_identity
  subscription_id_management       = local.subscription_id_management
}