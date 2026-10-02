data "azurerm_resource_group" "prod" {
  name = var.resource_group_name
}

# Storage account names must be globally unique, 3-24 lowercase letters/digits.
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "site" {
  name                            = "stresume${random_string.suffix.result}"
  resource_group_name             = data.azurerm_resource_group.prod.name
  location                        = data.azurerm_resource_group.prod.location
  account_kind                    = "StorageV2"
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  tags                            = var.tags
}

resource "azurerm_storage_account_static_website" "site" {
  storage_account_id = azurerm_storage_account.site.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

# Lets the GitHub identity upload site files into $web.
resource "azurerm_role_assignment" "github_site_upload" {
  scope                = azurerm_storage_account.site.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.github_principal_id
  principal_type       = "ServicePrincipal"
}