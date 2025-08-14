module "NetworkModule" {
  source          = "./NetworkModule"
  location        = 
  virtual_network = var.virtual_network
  subnet          = var.subnet
  address_space   = var.address_space
  address_prefix  = var.address_prefix
  Environment     = var.Environment
}

module "VmModule" {
  source                     = "./VmModule"
  subnet_id                  = module.NetworkModule.subnet_id
  windowvm                   = var.windowvm
  linuxvm                    = var.linuxvm
  windows_cred               = var.windows_cred
  linux_cred                 = var.linux_cred
  win_os_disk                = var.win_os_disk
  lin_os_disk                = var.lin_os_disk
  win_source_image_reference = var.win_source_image_reference
  lin_source_image_reference = var.lin_source_image_reference
  Environment                = var.Environment
}