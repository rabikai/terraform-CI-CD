resource "random_pet" "rg_name" {
}

resource "azurerm_resource_group" "rg" {
  name     = "inviting-shrew"
  location = var.resource_group_location
}

resource "random_string" "container_name" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

resource "azurerm_container_group" "container" {
  name                = "${var.container_group_name_prefix}-${random_string.container_name.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy

# #   container {
# #     name   = "${var.container_name_prefix}-${random_string.container_name.result}"
# #     image  = var.image
# #     cpu    = var.cpu_cores
# #     memory = var.memory_in_gb

# #     ports {
# #       port     = var.port
# #     }
# #   }
# # }

# resource "azurerm_storage_account" "tfstate" {
#   name                     = "sprixystg"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   allow_nested_items_to_be_public = false
#   min_tls_version = "TLS1_2"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_storage_container" "tfstate" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.tfstate.name
#   container_access_type = "private"
# }