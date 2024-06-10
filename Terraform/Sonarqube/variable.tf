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

variable "sonarvm_name" {
    description = "Sonarqube VM Name"
    type        = string
}

variable "sonarvm_username" {
    description = "Sonarqube VM Username"
    type        = string
}

variable "sonarvm_password" {
    description = "Sonarqube VM Password"
    type        = string
}

variable "sonarvm_size" {
    description = "Sonarqube VM Size"
    type        = string 
}

variable "sonarvm_nic" {
    description = "Sonarqube VM Network Interface Name"
    type        = string
}

variable "sonarpublicip_name" {
    description = "Sonarqube VM Public IP Name"
    type        = string
}

variable "sonarprivateip_name" {
    description = "Sonarqube VM Private IP Name"
    type        = string
}
