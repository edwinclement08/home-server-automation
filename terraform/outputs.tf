
output "ip_address" {
  value       = digitalocean_droplet.personal-automated.ipv4_address
  description = "The public IP address of your droplet application."
}

### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      droplet-ip = digitalocean_droplet.personal-automated.ipv4_address
    }
  )
  filename = "../ansible/inventory"
}