data vsphere_host nested-esxi {
  count         = tonumber(var.host_count)
  datacenter_id = tostring(vsphere_datacenter.dc.moid)
  name          = tostring("${var.host_prefix}${count.index+1}.${var.host_domain}")
}
