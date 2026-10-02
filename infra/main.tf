data "azurerm_resource_group" "prod" {
  name = "rg-resume-prod"
}

output "prod_rg_location" {
  value = data.azurerm_resource_group.prod.location
}