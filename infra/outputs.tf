output "storage_account_name" {
  value = azurerm_storage_account.site.name
}

output "website_url" {
  value = azurerm_storage_account.site.primary_web_endpoint
}