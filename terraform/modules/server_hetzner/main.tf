resource "hcloud_primary_ip" "public" {
  count = var.COUNT
  name          = format("%s-%s-%s-%s", "pubip", var.ROLE, var.STAGE, count.index + 1)
  datacenter    = "fsn1-dc14"
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = true
}

resource "hcloud_server" "server" {
  count = var.COUNT
  image = "${var.IMAGE_ID}"
  server_type = "${var.SERVER_TYPE}"
  name = format("%s-%s-%s",var.ROLE, count.index + 1, var.STAGE)
  ssh_keys = var.SSH_KEYS
  location = "${var.ZONES[count.index % length(var.ZONES)]}"
  network {
    network_id = var.NET_ID
  }
  public_net {
    ipv4 = hcloud_primary_ip.public[count.index].id
    ipv4_enabled = true
    ipv6_enabled = false
  }
  labels = {
    service : "${var.ROLE}"
    stage: "${var.STAGE}"
  }
}

