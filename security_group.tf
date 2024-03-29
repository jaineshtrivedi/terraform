/* This terraform configuration creates security group to be used for setting rules for our Jenkins VM */

resource "azurerm_network_security_group" "jenkins_security" {
  name                  = "${var.security_group_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"

  security_rule {
        name                    = "AllowSSH"
        priority                = 100
        direction               = "Inbound"
        access                  = "Allow"
        protocol                = "Tcp"
        source_port_range       = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  security_rule {
        name                    = "AllowHTTP"
        priority                = 200
        direction               = "Inbound"
        access                  = "Allow"
        protocol                = "Tcp"
        source_port_range       = "*"
    destination_port_range      = "8080"
    source_address_prefix       = "Internet"
    destination_address_prefix  = "*"
  }
}
