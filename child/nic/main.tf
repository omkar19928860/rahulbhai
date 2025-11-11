resource "azurerm_network_interface" "nic" {
  for_each = var.nics

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet1[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.pip1[each.key].id
  }
}


# resource "azurerm_network_interface" "nic" {
#   for_each = var.nics

#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   dynamic "ip_configuration" {
#     for_each = each.value.ip_configurations
#     content {
#       name                          = ip_configuration.value.name
#       subnet_id                     = ip_configuration.value.subnet_id
#       private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
#     }
#   }
# }