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

variable "mastervm_name" {
    description = "Control-Plane VM Name"
    type        = string
}

variable "mastervm_username" {
    description = "Control-Plane VM Username"
    type        = string
}

variable "mastervm_password" {
    description = "Control-Plane VM Password"
    type        = string
}

variable "mastervm_size" {
    description = "Control-Plane VM Size"
    type        = string 
}

variable "mastervm_nic" {
    description = "Control-Plane VM Network Interface Name"
    type        = string
}

variable "masterpublicip_name" {
    description = "Control-Plane VM Public IP Name"
    type        = string
}

variable "masterprivateip_name" {
    description = "Control-Plane VM Private IP Name"
    type        = string
}

variable "workervm_name" {
    description = "Gateway-Worke VM Name"
    type        = string
}

variable "workervm_username" {
    description = "Gateway-Worke VM Username"
    type        = string
}

variable "workervm_password" {
    description = "Gateway-Worke VM Password"
    type        = string
}

variable "workervm_size" {
    description = "Gateway-Worke VM Size"
    type        = string 
}

variable "workervm_nic" {
    description = "Gateway-Worke VM Network Interface Name"
    type        = string
}

variable "workerpublicip_name" {
    description = "Gateway-Worke VM Public IP Name"
    type        = string
}

variable "workerprivateip_name" {
    description = "Gateway-Worke VM Private IP Name"
    type        = string
}
