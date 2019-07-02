provider "azurerm" {
  subscription_id        = "${var.subscription_id}"
  client_id              = "${var.client_id}"
  client_secret          = "${var.client_secret}"
  tenant_id              = "${var.tenant_id}"
}

# Azure Credentials

variable "subscription_id" {default="5d8bf858-df27-42fc-ac35-64c493d71179"}
variable "client_id" {default="01e1c738-af37-4dd3-9fc2-7ab8b0595974"}
variable "client_secret" {default="t0MvoSIOiRiWtfwixiN/Wvhm02MPbGHql0d0qHFHBWQ="}
variable "tenant_id" {default="ecaa386b-c8df-4ce0-ad01-740cbdb5ba55"}

# Variables

variable "location" { default  = "West Europe" }
variable "resource_group_name" { default = "BASF_RG_SANDBOX_132" }
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
