module "network" {
  source = "../modules/network"
  STAGE = var.STAGE
  INT_NET_CIDR = var.INT_NET_CIDR
  INT_SUBNET = var.INT_SUBNET
}

module "security" {
  source = "../modules/security"
  ACCCESS_KEYS = var.ACCCESS_KEYS
}

module "haproxy_server" {
  source = "../modules/server_hetzner"
  STAGE = "dev"
  COUNT = 1
  IMAGE_ID = "debian-12"
  NET_ID = module.network.internal_net_id
  ROLE = "haproxy"
  SERVER_TYPE = "cpx11"
  SSH_KEYS = ["muczos"]
  ZONES = ["fsn1"]
}

module "nginx_server" {
  source = "../modules/server_hetzner"
  STAGE = "dev"
  COUNT = 2
  IMAGE_ID = "debian-12"
  NET_ID = module.network.internal_net_id
  ROLE = "nginx"
  SERVER_TYPE = "cpx11"
  SSH_KEYS = ["muczos"]
  ZONES = ["fsn1"]
}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/../templates/inventory.tpl",
    {
      nginx_servers = module.nginx_server.server_meta
      haproxy_servers = module.haproxy_server.server_meta
    }
  )
  filename = "../../ansible/inventory/hetzner_${var.STAGE}"
}
