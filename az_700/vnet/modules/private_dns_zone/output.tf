# output "console-ouput" {
#  description = "Public Dns"
#   value = "hi i made it "
# }

output "public_dns" {
  value = azurerm_private_dns_zone.az-700-pdns-R.name
}

output "public" {
  value = azurerm_private_dns_zone.az-700-pdns-R.resource_group_name
}


