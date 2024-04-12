<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.77.0 |
| <a name="requirement_cilium"></a> [cilium](#requirement\_cilium) | >=0.1.10 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.77.0 |
| <a name="provider_cilium"></a> [cilium](#provider\_cilium) | 0.2.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_subnet.node](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/virtual_network) | resource |
| [cilium_cilium.this](https://registry.terraform.io/providers/littlejo/cilium/latest/docs/resources/cilium) | resource |
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/2.4.0/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks"></a> [aks](#input\_aks) | Feature of aks | <pre>object({<br>    name       = string<br>    version    = string<br>    dns_prefix = string<br>    default_node_pool = object({<br>      name       = optional(string, "default")<br>      node_count = optional(number, 3)<br>      vm_size    = optional(string, "Standard_DS2_v2")<br>    })<br>  })</pre> | <pre>{<br>  "default_node_pool": {<br>    "name": "default",<br>    "node_count": 3,<br>    "vm_size": "Standard_DS2_v2"<br>  },<br>  "dns_prefix": "cilium",<br>  "name": "cilium-cluster-tf-provider",<br>  "version": "1.27"<br>}</pre> | no |
| <a name="input_cilium"></a> [cilium](#input\_cilium) | Feature of cilium | <pre>object({<br>    type                   = string<br>    version                = optional(string, "1.14.3")<br>    kube-proxy-replacement = optional(bool, false)<br>    ebpf-hostrouting       = optional(bool, false)<br>    hubble                 = optional(bool, false)<br>    hubble-ui              = optional(bool, false)<br>    gateway-api            = optional(bool, false)<br>    preflight-version      = optional(string, null)<br>    upgrade-compatibility  = optional(string, null)<br>  })</pre> | <pre>{<br>  "ebpf-hostrouting": false,<br>  "gateway-api": false,<br>  "hubble": false,<br>  "hubble-ui": false,<br>  "kube-proxy-replacement": false,<br>  "type": "cilium_custom",<br>  "version": "1.15.1"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Location (az group list \| jq -r '.[0].location') | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name (az group list \| jq -r '.[0].name') | `string` | n/a | yes |
| <a name="input_subnet_node"></a> [subnet\_node](#input\_subnet\_node) | Feature of subnet of node | `object({ address_prefixes = list(string), name = string })` | <pre>{<br>  "address_prefixes": [<br>    "10.240.0.0/16"<br>  ],<br>  "name": "nodesubnet"<br>}</pre> | no |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | Feature of vnet | `object({ address_space = list(string), name = string })` | <pre>{<br>  "address_space": [<br>    "10.0.0.0/8"<br>  ],<br>  "name": "cilium-tf-provider"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | The `azurerm_kubernetes_cluster`'s `kube_config_raw` argument. Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. |
| <a name="output_kube_host"></a> [kube\_host](#output\_kube\_host) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
