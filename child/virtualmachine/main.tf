resource "azurerm_windows_virtual_machine" "vm" {
    for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
#   name          = each.value.nic_name
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
    network_interface_ids = [data.azurerm_network_interface.nics[each.key].id]
                    

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}