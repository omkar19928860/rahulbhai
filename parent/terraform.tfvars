rgs = {
  rg1 = {
    name     = "resourcegroup1"
    location = "East US"
    tags = {
      environment = "dev"
    }
  }
  rg2 = {
    name     = "resourcegroup2"
    location = "West US"
  }
}

vnetnames = {
  vnet1 = {
    name                = "vnet1"
    location            = "East US"
    resource_group_name = "resourcegroup1"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        name             = "frontendsubnet"
        address_prefixes = ["10.0.1.0/24"]

      },
      { name             = "backendsubnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}
pipnames = {
  pip1 = {
    name                = "frontendpublicip"
    resource_group_name = "resourcegroup1"
    location            = "East US"
    allocation_method   = "Static"
    tags = {
      environment = "prod"
    }

  }
  pip2 = {
    name                = "backendpublicip"
    resource_group_name = "resourcegroup1"
    location            = "East US"
    allocation_method   = "Static"
  }
}
nicnames = {
  nic1 = {
    name                          = "frontendnic"
    location                      = "East US"
    resource_group_name           = "resourcegroup1"
    ip_configuration_name         = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "frontendpublicip"
    subnet_name                   = "frontendsubnet"
    virtual_network_name          = "vnet1"

  }
  nic2 = {
    name                          = "backendnic"
    location                      = "East US"
    resource_group_name           = "resourcegroup1"
    ip_configuration_name         = "ipconfig2"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "backendpublicip"
    subnet_name                   = "backendsubnet"
    virtual_network_name          = "vnet1"

  }
}
Virtual_Machines = {
  vm1 = {
    name                = "frontendvm"
    resource_group_name = "resourcegroup1"
    location            = "East US"
    size                = "Standard_B1s"
    nic_name            = "frontendnic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
  vm2 = {
    name                = "backendvm"
    resource_group_name = "resourcegroup1"
    location            = "East US"
    size                = "Standard_B1s"
    nic_name            = "backendnic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
}