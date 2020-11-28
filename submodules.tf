module folders {
  datastore_folders = local.folders.datastores
  dc_id             = vsphere_datacenter.dc.moid
  host_folders      = local.folders.hosts
  network_folders   = local.folders.networks
  source            = "jd4883/vsphere-cloudfoundation-folders/vmware"
  version           = "1.0.0"
  vm_folders        = local.folders.vms
}
