module "rg" {
  source = "../../modules/azurerm_rg"
  rg     = var.rg
}

module "virtual_network" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  snet       = var.snet
}

module "pip" {
  depends_on = [module.subnet]
  source     = "../../modules/azurerm_pip"
  pip        = var.pip
}
module "virtual_machine" {
  depends_on = [module.pip]
  source     = "../../modules/azurerm_vm"
  vms        = var.vms
}