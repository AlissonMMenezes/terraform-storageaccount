resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "container" {
  for_each              = var.containers
  name                  = each.keys
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}