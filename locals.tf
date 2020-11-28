locals {
  dc                = {
	name = tostring(var.datacenter)
  }
  clusters          = var.cluster
  esxi_hosts        = data.vsphere_host.nested-esxi
  folders           = {
	cluster    = tostring(var.cluster_folder)
	datacenter = var.datacenter_folder
	datastores = var.ds_folders
	hosts      = var.host_folders
	networks   = var.network_folders
	vds        = tostring(var.vds_folder)
	vms        = var.vm_folders
  }
  network           = {
	switches = {
	  contact                          = {
		name    = tostring(var.switch_contact_name)
		details = var.switch_contact_detail
	  }
	  block_ports                      = tobool(var.block_ports)
	  description                      = tostring(var.switch_description)
	  failback                         = tobool(var.failback)
	  folder                           = tostring(var.switch_path)
	  lacp                             = {
		api_version = tostring(var.lacp_api_version)
		enabled     = tobool(var.lacp_enabled)
		mode        = tostring(var.lacp_mode)
	  }
	  names                            = var.distribution_switches
	  security                         = tobool(var.l2_security)
	  uplinks                          = var.uplinks
	  vmnics                           = var.vmnics
	  mtu                              = tonumber(var.mtu)
	  failback                         = tobool(var.failback)
	  ipv4_address                     = tostring(var.switch_ipv4)
	  link_discovery                   = tostring(var.link_discovery)
	  link_discovery_operation         = tostring(var.link_discovery_operation)
	  multicast_mode                   = tostring(var.multicast_mode)
	  netflow_sampling_rate            = tonumber(var.netflow_sampling_rate)
	  network_resource_control_enabled = tobool(var.network_resource_control)
	}
  }
  tags              = {
	cluster    = var.cluster_tags
	datacenter = var.datacenter_tags
	switch     = var.switch_tags
  }
  custom_attributes = {
	cluster    = var.cluster_custom_attributes
	datacenter = var.datacenter_custom_attributes
	switch     = var.switch_custom_attributes
  }
  cluster           = {
	vsan                      = {
	  enabled = var.vsan_enabled
	}
	dpm                       = {
	  automation_level = var.dpm_automation_level
	  enabled          = var.dpm_automation_enabled
	  threshold        = var.dpm_automation_threshold
	}
	drs                       = {
	  enabled             = tobool(var.drs_enabled)
	  level               = tostring(var.drs_level)
	  predictive          = tobool(var.predictive_drs)
	  migration_threshold = var.drs_migration_threshold
	  enable_vm_overrides = var.drs_enable_vm_overrides
	  advanced            = var.drs_advanced
	}
	force_evacuate_on_destroy = var.cluster_force_evacuate_on_destroy
	ha                        = {
	  admission_control          = {
		host_failure_tolerance   = tostring(tonumber((var.ha_admission_control_host_failure_tolerance)))
		failover_host_system_ids = var.ha_admission_control_failover_host_system_ids
		datastore_ids            = var.ha_admission_control_datastore_ids
		performance_tolerance    = tonumber(var.ha_admission_control_resource_percentage)
		policy                   = tostring(var.ha_admission_control_policy)
		resource_percentage      = {
		  auto_compute = tobool(var.ha_admission_control_resource_percentage_auto_compute)
		  cpu          = tonumber(var.ha_admission_control_resource_percentage_cpu)
		  memory       = tonumber(var.ha_admission_control_resource_percentage_memory)
		}
		slot_policy              = {
		  size = tobool(var.ha_slot_policy_size)
		  cpu  = tonumber(var.ha_slot_policy_cpu)
		  ram  = tonumber(var.ha_slot_policy_ram)
		}
	  }
	  vm                         = {
		component_protection   = tostring(var.ha_vm_component_protection)
		failure_interval       = tonumber(var.ha_vm_failure_interval)
		maximum_failure_window = tonumber(var.ha_vm_maximum_failure_window)
		maximum_resets         = tonumber(var.ha_vm_maximum_resets)
		minimum_uptime         = tonumber(var.ha_vm_minimum_uptime)
		monitoring             = tostring(var.ha_vm_monitoring)
		restart                = {
		  condition = var.ha_vm_restart_condition
		  priority  = var.ha_vm_restart_priority
		  timeout   = var.ha_vm_restart_timeout
		}
	  }
	  das                        = {
		ignoreInsufficientHbDatastore = tobool(var.ha_das_ignoreInsufficientHbDatastore)
		ignoreRedundantNetWarning     = tobool(var.ha_das_ignoreRedundantNetWarning)
		includeFTcomplianceChecks     = tobool(var.ha_das_includeFTcomplianceChecks)
		iostatsInterval               = tostring(var.ha_das_iostatsInterval)
		respectVmVmAntiAffinityRules  = tobool(var.ha_das_respectVmVmAntiAffinityRules)
	  }
	  datastore                  = {
		apd = {
		  response        = tostring(var.ha_datastore_apd_response)
		  response_delay  = tonumber(var.ha_datastore_apd_response_delay)
		  recovery_action = var.ha_datastore_apd_recovery_action
		}
		pdl = {
		  response = tostring(var.ha_datastore_pdl_response)
		}
	  }
	  enabled                    = tobool(var.ha_enabled ? var.ha_enabled: true)
	  heartbeat_datastore_policy = tostring(contains(["allFeasibleDsWithUserPreference", "allFeasibleDs", "userSelectedDs"], var.proactive_ha_automation_level) ? var.ha_heartbeat_datastore_policy : "allFeasibleDsWithUserPreference")
	  host                       = {
		isolation_response   = tostring(var.ha_host_isolation_response)
		monitoring           = tostring(var.ha_host_monitoring)
		cluster_exit_timeout = var.ha_host_cluster_exit_timeout
		managed              = var.ha_host_managed
		system_ids           = data.vsphere_host.nested-esxi.*.id
	  }
	  proactive                  = {
		enabled            = var.ha_proactive_enabled
		automation_level   = tostring(contains(["Automated", "Manual"], var.proactive_ha_automation_level) ? var.proactive_ha_automation_level : "Manual")
		provider_ids       = var.proactive_ha_provider_ids
		remediation_action = tostring(contains(["QuarantineMode", "MaintenanceMode"], var.proactive_ha_remediation) ? var.proactive_ha_remediation : "QuarantineMode")
	  }
	}
  }
}
