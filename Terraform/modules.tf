module "ResourceGroup" {
    source = "./ResourceGroup"

    rg_name = "RG-K8"
    rg_location = "Central India"
}

module "vNetwork" {
    source = "./vNetwork"

    rg_name= module.ResourceGroup.rg_name_out
    rg_location = module.ResourceGroup.rg_location_out    
}

module "K8Cluster" {
    source = "./K8Cluster"

    rg_name= module.ResourceGroup.rg_name_out
    rg_location = module.ResourceGroup.rg_location_out
    vm_subnet = module.vNetwork.k8_subnet_out

    mastervm_name = "k8-master"
    mastervm_size = "Standard_D2s_v3"
    mastervm_username = "<add-username>"
    mastervm_password = "<add-password>"
    mastervm_nic = "master-eth33"
    masterpublicip_name = "master-PublicIP"
    masterprivateip_name = "master-PrivateIP"
    
    workervm_name = "k8-worker"
    workervm_size = "Standard_D2s_v3"
    workervm_username = "<add-username>"
    workervm_password = "<add-password>"
    workervm_nic = "worker-eth33"
    workerpublicip_name = "worker-PublicIP"
    workerprivateip_name = "worker-PrivateIP"
}

module "Ansible" {
    source = "./Ansible"

    rg_name= module.ResourceGroup.rg_name_out
    rg_location = module.ResourceGroup.rg_location_out
    vm_subnet = module.vNetwork.vms_subnet_out
    
    ansiblevm_name = "ansible"
    ansiblevm_size = "Standard_B2s"
    ansiblevm_username = "<add-username>"
    ansiblevm_password = "<add-password>"
    ansiblevm_nic = "ansible-eth33"
    ansiblepublicip_name = "ansible-PublicIP"
    ansibleprivateip_name = "ansible-PrivateIP"
}

module "Jenkins" {
    source = "./Jenkins"

    rg_name= module.ResourceGroup.rg_name_out
    rg_location = module.ResourceGroup.rg_location_out
    vm_subnet = module.vNetwork.vms_subnet_out
    
    jenkinsvm_name = "jenkins"
    jenkinsvm_size = "Standard_D2s_v3"
    jenkinsvm_username = "<add-username>"
    jenkinsvm_password = "<add-password>"
    jenkinsvm_nic = "jenkins-eth33"
    jenkinspublicip_name = "jenkins-PublicIP"
    jenkinsprivateip_name = "jenkins-PrivateIP"
}

module "Sonarqube" {
    source = "./Sonarqube"

    rg_name= module.ResourceGroup.rg_name_out
    rg_location = module.ResourceGroup.rg_location_out
    vm_subnet = module.vNetwork.vms_subnet_out
    
    sonarvm_name = "sonarqube"
    sonarvm_size = "Standard_DS1_v2"
    sonarvm_username = "<add-username>"
    sonarvm_password = "<add-password>"
    sonarvm_nic = "sonar-eth33"
    sonarpublicip_name = "sonar-PublicIP"
    sonarprivateip_name = "sonar-PrivateIP"
}