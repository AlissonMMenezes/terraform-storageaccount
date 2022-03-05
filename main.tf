resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  blob_properties {
    delete_retention_days = 7
    container_delete_retention_policy = 7
  }

  identity {
    type = "SystemAssigned"
  }
  
}

resource "azurerm_storage_container" "container" {
  for_each              = toset(var.containers)
  name                  = each.key
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
  is_hns_enabled        = "true"

}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = "example"
  storage_account_id = azurerm_storage_account.sa.id

  properties = {
    hello = "aGVsbG8="
  }
}