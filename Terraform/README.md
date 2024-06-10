# Setup Cloud Environment

This setup uses Terraform modules to deploy resources in Azure. It includes five Ubuntu VMs with network configuration and two subnets. One subnet is designated for Jenkins, SonarQube, and Ansible VMs, while the other subnet is reserved for a Kubernetes cluster, comprising a Master Node and Worker Node.

![](https://github.com/chathuracsd/Project-Images/blob/main/CICD-Project-Cloud-Infrastructure.jpg)

### Initialize the Terraform working directory

```bash
terraform init
```

### Plan the Deployment

```
terraform plan 
```

##### Save the execution plan to a file

```
terraform plan -out webapps.tfplan 
```

### Apply the Execution Plan

```
terraform apply
```

##### Or, Apply the Saved Execution Plan

```
terraform apply webapps.tfplan
```

### Destroy the Resources Managed by Terraform

```
terraform destroy 
```

For more information, please refer the link.

Basic CLI Features | Terraform | HashiCorp https://developer.hashicorp.com/terraform/cli/commands
