resource vsphere_datacenter dc {
  name              = local.dc.name
  folder            = local.folders.datacenter
  tags              = local.tags.datacenter
  custom_attributes = local.custom_attributes.datacenter
}

resource vsphere_distributed_virtual_switch vds {
  active_uplinks                   = local.network.switches.uplinks
  allow_forged_transmits           = !local.network.switches.security
  allow_mac_changes                = !local.network.switches.security
  allow_promiscuous                = !local.network.switches.security
  block_all_ports                  = local.network.switches.block_ports
  check_beacon                     = local.network.switches.security
  contact_detail                   = local.network.switches.contact.details
  contact_name                     = local.network.switches.contact.name
  count                            = length(local.network.switches.names)
  datacenter_id                    = vsphere_datacenter.dc.moid
  description                      = local.network.switches.description
  failback                         = local.network.switches.failback
  folder                           = local.network.switches.folder
  ipv4_address                     = local.network.switches.ipv4_address
  lacp_api_version                 = local.network.switches.lacp.api_version
  lacp_enabled                     = local.network.switches.lacp.enabled
  lacp_mode                        = local.network.switches.lacp.mode
  tags                             = local.tags.switch
  dynamic host {
	for_each = local.esxi_hosts.*.id
	content {
	  devices        = local.network.switches.vmnics
	  host_system_id = host.value
	}
  }
  link_discovery_operation         = local.network.switches.link_discovery_operation
  link_discovery_protocol          = local.network.switches.link_discovery
  max_mtu                          = local.network.switches.mtu
  multicast_filtering_mode         = local.network.switches.multicast_mode
  name                             = local.network.switches.names[count.index]
  netflow_sampling_rate            = local.network.switches.netflow_sampling_rate
  network_resource_control_enabled = local.network.switches.network_resource_control_enabled
}

resource vsphere_compute_cluster cluster {
  count                                                 = length(local.clusters)
  custom_attributes                                     = local.custom_attributes.cluster
  datacenter_id                                         = vsphere_datacenter.dc.moid
  depends_on                                            = [module.folders]
  dpm_automation_level                                  = local.cluster.dpm.automation_level
  dpm_enabled                                           = local.cluster.dpm.enabled
  dpm_threshold                                         = local.cluster.dpm.threshold
  drs_advanced_options                                  = local.cluster.drs.advanced
  drs_automation_level                                  = local.cluster.drs.level
  drs_enable_predictive_drs                             = local.cluster.drs.predictive
  drs_enable_vm_overrides                               = local.cluster.drs.enable_vm_overrides
  drs_enabled                                           = local.cluster.drs.enabled
  drs_migration_threshold                               = local.cluster.drs.migration_threshold
  folder                                                = local.folders.cluster
  force_evacuate_on_destroy                             = local.cluster.force_evacuate_on_destroy
  ha_admission_control_failover_host_system_ids         = local.cluster.ha.admission_control.failover_host_system_ids
  ha_admission_control_host_failure_tolerance           = local.cluster.ha.admission_control.host_failure_tolerance
  ha_admission_control_performance_tolerance            = local.cluster.ha.admission_control.performance_tolerance
  ha_admission_control_policy                           = local.cluster.ha.admission_control.policy
  ha_admission_control_resource_percentage_auto_compute = local.cluster.ha.admission_control.resource_percentage.auto_compute
  ha_admission_control_resource_percentage_cpu          = local.cluster.ha.admission_control.resource_percentage.cpu
  ha_admission_control_resource_percentage_memory       = local.cluster.ha.admission_control.resource_percentage.memory
  ha_admission_control_slot_policy_explicit_cpu         = local.cluster.ha.admission_control.slot_policy.cpu
  ha_admission_control_slot_policy_explicit_memory      = local.cluster.ha.admission_control.slot_policy.ram
  ha_admission_control_slot_policy_use_explicit_size    = local.cluster.ha.admission_control.slot_policy.size
  ha_datastore_apd_recovery_action                      = local.cluster.ha.datastore.apd.recovery_action
  ha_datastore_apd_response                             = local.cluster.ha.datastore.apd.response
  ha_datastore_apd_response_delay                       = local.cluster.ha.datastore.apd.response_delay
  ha_datastore_pdl_response                             = local.cluster.ha.datastore.pdl.response
  ha_advanced_options                                   = {
	"das.ignoreInsufficientHbDatastore" = local.cluster.ha.das.ignoreInsufficientHbDatastore
	"das.ignoreRedundantNetWarning"     = local.cluster.ha.das.ignoreRedundantNetWarning
	"das.includeFTcomplianceChecks"     = local.cluster.ha.das.includeFTcomplianceChecks
	"das.iostatsInterval"               = local.cluster.ha.das.iostatsInterval
	"das.respectVmVmAntiAffinityRules"  = local.cluster.ha.das.respectVmVmAntiAffinityRules
  }
  ha_enabled                                            = local.cluster.ha.enabled
  ha_heartbeat_datastore_ids                            = local.cluster.ha.admission_control.datastore_ids
  ha_heartbeat_datastore_policy                         = local.cluster.ha.heartbeat_datastore_policy
  ha_host_isolation_response                            = local.cluster.ha.host.isolation_response
  ha_host_monitoring                                    = local.cluster.ha.host.monitoring
  ha_vm_component_protection                            = local.cluster.ha.vm.component_protection
  ha_vm_dependency_restart_condition                    = local.cluster.ha.vm.restart.condition
  ha_vm_failure_interval                                = local.cluster.ha.vm.failure_interval
  ha_vm_maximum_failure_window                          = local.cluster.ha.vm.maximum_failure_window
  ha_vm_maximum_resets                                  = local.cluster.ha.vm.maximum_resets
  ha_vm_minimum_uptime                                  = local.cluster.ha.vm.minimum_uptime
  ha_vm_monitoring                                      = local.cluster.ha.vm.monitoring
  ha_vm_restart_priority                                = local.cluster.ha.vm.restart.priority
  ha_vm_restart_timeout                                 = local.cluster.ha.vm.restart.timeout
  host_cluster_exit_timeout                             = local.cluster.ha.host.cluster_exit_timeout
  host_managed                                          = local.cluster.ha.host.managed
  host_system_ids                                       = local.cluster.ha.host.system_ids
  name                                                  = local.clusters[count.index]
  proactive_ha_automation_level                         = local.cluster.ha.proactive.automation_level
  proactive_ha_enabled                                  = local.cluster.ha.proactive.enabled
  proactive_ha_moderate_remediation                     = local.cluster.ha.proactive.remediation_action
  proactive_ha_provider_ids                             = local.cluster.ha.proactive.provider_ids
  proactive_ha_severe_remediation                       = local.cluster.ha.proactive.remediation_action
  tags                                                  = local.tags.cluster
  vsan_enabled                                          = local.cluster.vsan.enabled
  lifecycle {
	ignore_changes = [vsan_disk_group]
  }
}
