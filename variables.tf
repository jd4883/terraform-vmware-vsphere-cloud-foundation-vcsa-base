variable block_ports {default = false}
variable cluster {type = list(string)}
variable cluster_custom_attributes {default = {}}
variable cluster_folder {type = string}
variable cluster_force_evacuate_on_destroy {default = null}
variable datacenter {type = string}
variable datacenter_custom_attributes {default = {}}
variable drs_advanced {default = {}}
variable drs_enabled {default = true}
variable drs_level {default = "fullyAutomated"}
variable ds_folders {type = list(string)}
variable failback {default = true}
variable ha_admission_control_datastore_ids {default = []}
variable ha_admission_control_failover_host_system_ids {default = []}
variable ha_admission_control_host_failure_tolerance {default = 1}
variable ha_admission_control_policy {default = "disabled"}
variable ha_admission_control_resource_percentage_auto_compute {default = null}
variable ha_admission_control_resource_percentage_cpu {default = 100}
variable ha_admission_control_resource_percentage_memory {default = 100}
variable ha_das_ignoreInsufficientHbDatastore {default = true}
variable ha_das_ignoreRedundantNetWarning {default = true}
variable ha_das_includeFTcomplianceChecks {default = false}
variable ha_das_iostatsInterval {default = 0}
variable ha_das_respectVmVmAntiAffinityRules {default = true}
variable ha_datastore_apd_recovery_action {default = "none"}
variable ha_datastore_apd_response {default = "restartConservative"}
variable ha_datastore_apd_response_delay {default = 180}
variable ha_datastore_pdl_response {default = "restartAggressive"}
variable ha_enabled {default = false}
variable ha_host_isolation_response {default = "none"}
variable ha_host_managed {default = null}
variable host_count {default = 4}
variable host_domain {type = string}
variable host_folders {type = list(string)}
variable host_prefix {type = string}
variable l2_security {default = false}
variable lacp_enabled {default = false}
variable lacp_mode {default = "passive"}
variable link_discovery {default = "lldp"}
variable link_discovery_operation {default = "both"}
variable mtu {default = 9000}
variable multicast_mode {default = "snooping"}
variable netflow_sampling_rate {default = 4096}
variable network_folders {type = list(string)}
variable network_resource_control {default = true}
variable predictive_drs {default = false}
variable switch_custom_attributes {default = {}}
variable switch_path {default = "Management Networks"}
variable vds_folder {type = string}
variable vm_folders {type = list(string)}

variable ha_host_cluster_exit_timeout {
  type = number
  default = 3600
}

variable ha_proactive_enabled {
  type = bool
  default = false
}

variable ha_vm_restart_condition {
  type = string
  default = "none"
}

variable ha_vm_restart_priority {
  type = string
  default = "medium"
}

variable ha_vm_restart_timeout {
  type = number
  default = 600
}

variable ha_slot_policy_size {
  type = bool
  default = false
}

variable ha_slot_policy_cpu {
  type = number
  default = 32
}

variable ha_slot_policy_ram {
  type = number
  default = 100
}

variable ha_admission_control_resource_percentage  {
  type = number
  default = 100
}

variable distribution_switches {
  type        = list(string)
  description = "names of distribution switches"
  default     = []
}

variable host_system_ids {
  type    = list(string)
  default = []
}

variable uplinks {
  type    = list(string)
  default = [
	"uplink1",
	"uplink2"
  ]
}

variable vmnics {
  type    = list(string)
  default = [
	"vmnic0",
	"vmnic1"
  ]
}

variable ha_host_monitoring {
  type    = string
  default = "enabled"
}

variable ha_vm_component_protection {
  type    = string
  default = "enabled"
}

variable ha_vm_failure_interval {
  type    = number
  default = 30
}

variable ha_vm_maximum_failure_window {
  type    = number
  default = -1
}

variable ha_vm_maximum_resets {
  type    = number
  default = 3
}

variable ha_vm_minimum_uptime {
  type    = number
  default = 120
}

variable ha_vm_monitoring {
  type    = string
  default = "vmMonitoringDisabled"
}

variable dpm_automation_level {
  type    = string
  default = "automated"
}

variable dpm_automation_enabled {
  type    = bool
  default = false
}


variable dpm_automation_threshold {
  type    = number
  default = 3
}

variable drs_enable_vm_overrides {
  type = bool
  default = true
}

variable drs_migration_threshold {
  type    = number
  default = 3
}

variable switch_description {
  type    = string
  default = ""
}

variable cluster_tags {
  type    = list(string)
  default = []
}

variable switch_tags {
  type    = list(string)
  default = []
}

variable lacp_api_version {
  type    = string
  default = "multipleLag"
}

variable switch_contact_detail {
  default = null
}

variable switch_contact_name {
  type    = string
  default = ""
}

variable switch_ipv4 {
  type    = string
  default = ""
}

variable datacenter_tags {
  type    = list(string)
  default = []
}

variable datacenter_folder {
  type    = string
  default = ""
}

variable proactive_ha_provider_ids {
  type    = list(string)
  default = []
}

variable ha_heartbeat_datastore_policy {
  default = "allFeasibleDsWithUserPreference"
}
variable proactive_ha_automation_level {
  default = "Manual"
}
variable proactive_ha_remediation {
  default = "QuarantineMode"
}
variable vsan_enabled {
  default = true
  type = bool
}
