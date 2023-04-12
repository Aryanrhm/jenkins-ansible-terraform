## Jenkins-Ansible-Terraform


This repository uses the Jenkins AMI created whit Packer and Ansible using [this](https://github.com/aryanrhm/jenkins-ami) repository. The Jenkins server is then configured with Jenkins Configuration as Code (JCasC) to create a pipeline job that runs a Jenkinsfile located in another repository.

### Prerequisites
Before you can use this code, you need to have the following:

* An AWS account
* Terraform and Ansible installed on your local machine
* Git

### Installation
To use this code, follow these steps:

* Clone this repository onto your local machine.
* 'cd' into the cloned repository.
* Create a file called terraform.tfvars and populate it with the required variables. An example is provided in the terraform.tfvars.example file.
* Run terraform init to initialize the Terraform working directory.
* Run terraform apply to apply the Terraform code and create the EC2 instance and security group.

Once the EC2 instance is created, Terraform will run the local-exec provisioner, which will configure Jenkins using Ansible. The pipeline is created based on the Jenkinsfile located in [this repo](https://github.com/aryanrhm/nodejs-pipeline) under the misc directory.
 

### Contributing
If you find a bug or have a suggestion for this repository, please open an issue or submit a pull request. Contributions are always welcome!
