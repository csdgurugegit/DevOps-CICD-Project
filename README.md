# DevOps CI/CD Pipeline For Dev & Production

## Overview

This open-source project shows how to create a strong and efficient CI/CD pipeline for both development and production. Using popular tools and best practices, it provides a clear example of how to automate and improve the software delivery process.

![](https://github.com/chathuracsd/Project-Images/blob/main/CICD-Project-Design.jpg)

## Key Components

#### **CI/CD Pipelines**

- Two separate pipelines: one for the **development** environment and one for the **production** environment.
- Managed using **Jenkins,** a widely-adopted automation server known for its flexibility and extensive plugin ecosystem.

#### **Infrastructure as Code (IaC)**

- Use **Terraform** to provision and manage infrastructure on **Azure**.
- Ensure consistent, repeatable, and scalable infrastructure deployment.

#### **Security and Quality Assurance**

- **Trivy**: Scan directory files and Docker images for vulnerabilities to ensure security compliance.
- **SonarQube**: Conduct code quality analysis to detect bugs, vulnerabilities, and code smells, thereby maintaining high code quality standards.

#### **Configuration Management**

- **Ansible Playbook**: Automate the configuration and setup of all components, including Jenkins, SonarQube, and Kubernetes clusters.
- Ensure consistency and reduce manual intervention through infrastructure automation.

## Benefits

- **Automation**: Reduce manual tasks and streamline the software development lifecycle.
- **Scalability**: Easily scale infrastructure and configurations to meet growing demands.
- **Security**: Incorporate security checks early in the development process to prevent vulnerabilities.
- **Quality Assurance**: Maintain high standards of code quality and reliability.

## Get Started

### Step 1: Clone the Project Repository

1. **Clone the Git Repository**:
   
   - Open a terminal.
   
   - Run the following command:
     
     ```bash
     git clone <repository_url>
     ```

### Step 2: Setup Azure Infrastructure with Terraform

1. **Setup Azure App Registrations**:
   
   - Log in to the Azure portal.
   - Register a new application.
   - Note down the Application (client) ID, Directory (tenant) ID, and Client Secret.

2. **Build Azure Infrastructure Using Terraform**:
   
   - Ensure Terraform is installed on your machine.
   
   - Navigate to the cloned project directory.
   
   - Initialize Terraform:
     
     ```bash
     terraform init
     ```
   
   - Apply the Terraform configuration:
     
     ```bash
     terraform plan
     terraform apply
     ```
   
   - Provide the necessary Azure details (Client ID, Secret, Tenant ID) when prompted.

### Step 3: Setup Jenkins

1. **Install Java OpenJDK 17**:
   
   - Install OpenJDK 17:
     
     ```bash
     sudo apt update
     sudo apt install openjdk-18-jre-headless 
     ```

2. **Install Jenkins**:
   
   - Add the Jenkins repository and key:
     
     ```bash
     sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
       https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
     echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
       https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
       /etc/apt/sources.list.d/jenkins.list > /dev/null
     sudo apt-get update -y
     ```
   
   - Install Jenkins:
     
     ```bash
     sudo apt-get install jenkins
     ```
   
   - Start Jenkins:
     
     ```bash
     sudo systemctl start jenkins
     sudo systemctl enable jenkins
     ```

3. **Install Docker, Kubectl, and Trivy**:
   
   - Install Docker:
     
     Add jenkins and current user to docker group
     
     ```bash
     sudo apt install docker.io
     sudo usermod -aG docker jenkins $USER
     ```
   
   - Install Kubectl:
     
     ```bash
     curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
     chmod +x ./kubectl
     sudo mv ./kubectl /usr/local/bin
     kubectl version --short --client
     ```
   
   - Install Trivy:
     
     ```bash
     sudo apt-get install wget apt-transport-https gnupg lsb-release
     wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
     echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
     sudo apt-get update -y
     sudo apt-get install trivy -y
     ```

4. **Install Jenkins Plugins**:
   
   - Access Jenkins through a web browser (`http://your_server_ip:8080`).
   - Go to `Manage Jenkins > Manage Plugins > Available`.
   - Install the following plugins:
     - Docker
     - Docker-Pipeline
     - Kubernetes
     - Kubernetes CLI
     - SonarQube

5. **Configure Tools in Jenkins**:
   
   - Go to `Manage Jenkins > Global Tool Configuration`.
   - Configure SonarQube and Docker.

6. **Set SonarQube Server**:
   
   - Go to `Manage Jenkins > Configure System`.
   - Add SonarQube server details.

7. **Add Credentials in Jenkins**:
   
   - Go to `Manage Jenkins > Manage Credentials`.
   - Add the necessary credentials for Docker, Kubernetes, and SonarQube.

8. **Create Pipelines**:
   
   - Create two pipelines: Dev and Production.
   - Add the necessary script to the Jenkinsfile.

### Step 4: Setup SonarQube

1. **Install Docker**:
   
   ```bash
   sudo apt install docker.io
   sudo usermod -aG docker $USER
   ```

2. **Install SonarQube Using Docker Compose**:
   
   - Create a `docker-compose.yml` file:
     
     ```yaml
     version: '3.8'
     
     services:
       sonarqube:
         image: sonarqube:latest
         container_name: sonarqube
         depends_on:
           - db
         ports:
           - "9000:9000"
         environment:
           - SONAR_JDBC_URL=jdbc:postgresql://db:5432/sonarqube
           - SONAR_JDBC_USERNAME=sonar
           - SONAR_JDBC_PASSWORD=sonar
         volumes:
           - sonarqube_data:/opt/sonarqube/data
           - sonarqube_logs:/opt/sonarqube/logs
           - sonarqube_extensions:/opt/sonarqube/extensions
         restart: always
     
       db:
         image: postgres:latest
         container_name: sonarqube_db
         environment:
           - POSTGRES_USER=sonar
           - POSTGRES_PASSWORD=sonar
           - POSTGRES_DB=sonarqube
         volumes:
           - postgresql_data:/var/lib/postgresql/data
         restart: always
     
     volumes:
       sonarqube_data:
       sonarqube_logs:
       sonarqube_extensions:
       postgresql_data:
     
     
     ```
   
   - Run Docker Compose:
     
     ```bash
     sudo docker-compose up -d
     ```

3. **Configure SonarQube**:
   
   - Access SonarQube through a web browser (`http://your_server_ip:9000`).
   - Login and create an access token.
   - Add the token to Jenkins credentials.

### Step 5: Setup Kubernetes Cluster

1. **Setup Kubernetes Cluster Using kubeadm**:
   
   - Install kubeadm on all nodes:
     
     ```bash
     sudo apt-get update
     sudo apt-get upgrade
     ```
   
   - Run `kubeadm-common.sh` on both master and worker nodes:
     
     Files available in **"/Ansible/k8-cluster-playbook/scripts"**
     
     ```bash
     sh kubeadm-common.sh
     ```
   
   - Run `kubeadm-master.sh` on the master node:
     
     Define POD network and Public IP Accesss "True"
     
     ```bash
     sh kubeadm-master.sh
     ```

2. **Configure MetalLB**:
   
   - Install MetalLB:
     
     ```bash
     kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/manifests/namespace.yaml
     kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/manifests/metallb.yaml
     ```
   
   - Configure MetalLB, Ingress and Service Account:
     
     - Deploy `configmap`, `nginx ingress`, and `service account` configurations.
     - Ensure the service account secret token is added to Jenkins credentials. 

## License

This project is licensed under the MIT License. See the LICENSE file in the repository for more details.
