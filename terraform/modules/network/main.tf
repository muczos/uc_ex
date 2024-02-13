resource "hcloud_network" "internal" {
  name = "${var.STAGE}-net"
  ip_range = "${var.INT_NET_CIDR}"
}

resource "hcloud_network_subnet" "internal-subnet" {
  network_id   = hcloud_network.internal.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "${var.INT_SUBNET}"
  depends_on = [
    hcloud_network.internal,
  ]
}

