output "all" {
  value = hcloud_server.server[*]
}

output "server_meta" {
  value = [for vm in hcloud_server.server : {
    ip_pub = vm.ipv4_address
    ip_priv = [for i in flatten(vm.network) : i.ip][0]
    name = vm.name
  }] 
}