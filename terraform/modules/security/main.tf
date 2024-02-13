resource "hcloud_ssh_key" "admins" {
  for_each = var.ACCCESS_KEYS
  name       = "${each.key}"
  public_key = "${each.value}"
}
