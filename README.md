# terraform-vmware-vsphere-cloud-foundation-vcsa-base
Once imported, this is a working base with minimal tweaks to what cloud foundation brings up. This gives a more granular set of controls post deployment. I am developing a series of submodules for different purposes here to fully automate the bringup of Tanzu Kubernetes

## Overview
This submodule creates the following vcenter resources (though in reality you are probably importing these and then managing them in terraform, at least that is my use-case for why i built this):
* vds switch configuration for Vmware Cloud Foundation
* vmware data center resource, later referenced only by data block
* vsan cluster creation / setting tuning
* folder creation / renaming
* standardizes tags based on provided values

### NOTE: this readme is a WIP and does not give complete guidance towards how to use this module. I will come back to this and add in more granular descriptive elements here to cover what steps are taken, what they do, and how to configure them ###
