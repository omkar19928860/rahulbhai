variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
  }))

}

variable "vnetnames" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))

}


variable "pipnames" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }))

}

variable "nicnames" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    public_ip_name                = string
    subnet_name                   = string
    virtual_network_name          = string
  }))
}

variable "Virtual_Machines" {
  description = "Map of Windows Virtual Machines to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    nic_name            = string

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
