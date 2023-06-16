// backend state file
terraform {
  backend "azurerm" {
      resource_group_name = "tfm-rgp-01"
      storage_account_name = "1sta1739"
      container_name = "tf-tfstate"
      key ="ex100-2-spn.tfstate"
  }
}
