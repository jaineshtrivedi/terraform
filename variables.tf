provider "azurerm" {
  subscription_id        = "${var.subscription_id}"
  client_id              = "${var.client_id}"
  client_secret          = "${var.client_secret}"
  tenant_id              = "${var.tenant_id}"
}

# Azure Credentials

variable "subscription_id" {default="45125fa1-19bc-4a4c-9144-ee19cc0a071a"}
variable "client_id" {default="b731572d-19b5-49e9-8498-94bb8576a533"}
variable "client_secret" {default="bd215b02-7b96-410e-84ba-ea0d004471e8"}
variable "tenant_id" {default="c2db01a8-ffa7-494b-b17a-376fc92de135"}

# Variables

variable "location" { default  = "East US" }
variable "resource_group_name" { default = "jenkins" }
variable "vnet_cidr" { default = "192.168.0.0/16" }
variable "subnet_cidr" { default = "192.168.1.0/24" }
variable "vm_username" {default="ubuntu"}
variable "vm_password" {default="Jainesh@2014"}
variable "vm_size" { default = "Basic_A1" }

variable "network_name" { default = "jenkins-virtual-network" }
variable "subnet_name" { default = "Jenkins-Subnet" }
variable "security_group_name" { default = "Jenkins-SecurityGroup"}
variable "storage_account_name" {default="jainesh"}
variable "container_name" { default = "vhds" }
variable "vm_name" { default = "Jenkins_VM" }
variable "os_name" { default = "Ubuntu_Jenkins" }