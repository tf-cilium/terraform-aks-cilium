variable "resource_group_name" {
  description = "Resource Group Name (az group list | jq -r '.[0].name')"
  type        = string
}

variable "location" {
  description = "Location (az group list | jq -r '.[0].location')"
  type        = string
}

variable "vnet" {
  description = "Feature of vnet"
  type        = object({ address_space = list(string), name = string })
  default = {
    address_space = ["10.0.0.0/8"]
    name          = "cilium-tf-provider"
  }
}

variable "subnet_node" {
  description = "Feature of subnet of node"
  type        = object({ address_prefixes = list(string), name = string })
  default = {
    address_prefixes = ["10.240.0.0/16"]
    name             = "nodesubnet"
  }
}

variable "aks" {
  description = "Feature of aks"
  type = object({
    name       = string
    version    = string
    dns_prefix = string
    default_node_pool = object({
      name       = optional(string, "default")
      node_count = optional(number, 3)
      vm_size    = optional(string, "Standard_DS2_v2")
    })
  })
  default = {
    name       = "cilium-cluster-tf-provider"
    version    = "1.27"
    dns_prefix = "cilium"
    default_node_pool = {
      name       = "default"
      node_count = 3
      vm_size    = "Standard_DS2_v2"
    }
  }
}

variable "cilium" {
  description = "Feature of cilium"
  type = object({
    version                = optional(string, "1.14.3")
    kube-proxy-replacement = optional(bool, false)
    ebpf-hostrouting       = optional(bool, false)
    hubble                 = optional(bool, false)
    hubble-ui              = optional(bool, false)
    gateway-api            = optional(bool, false)
    preflight-version      = optional(string, null)
    upgrade-compatibility  = optional(string, null)
  })
  default = {
    version                = "1.15.1"
    kube-proxy-replacement = false
    ebpf-hostrouting       = false
    hubble                 = false
    hubble-ui              = false
    gateway-api            = false
  }
}
