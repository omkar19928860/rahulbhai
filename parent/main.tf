module "rg" {

  source          = "../child/resourcegroup"
  resource_groups = var.rgs

}

module "vnet" {
  source     = "../child/vnet"
  vnets      = var.vnetnames
  depends_on = [module.rg]

}

module "pip1" {
  source     = "../child/publicip"
  pips       = var.pipnames
  depends_on = [module.rg]

}

module "nic1" {
  source     = "../child/nic"
  nics       = var.nicnames
  depends_on = [module.rg, module.pip1, module.vnet]

}

module "vm" {
  source     = "../child/virtualmachine"
  vms        = var.Virtual_Machines
  depends_on = [module.rg, module.nic1, module.vnet, module.pip1]

}