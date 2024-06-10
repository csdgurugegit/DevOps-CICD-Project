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

variable "jenkinsvm_name" {
    description = "Jenkins VM Name"
    type        = string
}

variable "jenkinsvm_username" {
    description = "Jenkins VM Username"
    type        = string
}

variable "jenkinsvm_password" {
    description = "Jenkins VM Password"
    type        = string
}

variable "jenkinsvm_size" {
    description = "Jenkins VM Size"
    type        = string 
}

variable "jenkinsvm_nic" {
    description = "Jenkins VM Network Interface Name"
    type        = string
}

variable "jenkinspublicip_name" {
    description = "Jenkins VM Public IP Name"
    type        = string
}

variable "jenkinsprivateip_name" {
    description = "Jenkins VM Private IP Name"
    type        = string
}
