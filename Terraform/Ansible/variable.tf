variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "rg_location" {
  description = "Resource Group Location"
  type        = string
}

variable "vm_subnet" {
  description = "Select Subnet"
  type        = string
}

variable "ansiblevm_name" {
    description = "Ansible VM Name"
    type        = string
}

variable "ansiblevm_username" {
    description = "Ansible VM Username"
    type        = string
}

variable "ansiblevm_password" {
    description = "Ansible VM Password"
    type        = string
}

variable "ansiblevm_size" {
    description = "Ansible VM Size"
    type        = string 
}

variable "ansiblevm_nic" {
    description = "Ansible VM Network Interface Name"
    type        = string
}

variable "ansiblepublicip_name" {
    description = "Ansible VM Public IP Name"
    type        = string
}

variable "ansibleprivateip_name" {
    description = "Ansible VM Private IP Name"
    type        = string
}
