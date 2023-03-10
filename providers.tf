# Configure the AWS Provider
terraform {
  backend "s3" {
    bucket = "aws-terraform-tfstate-v1"
    key    = "jenkins-ansible-terraform/terraform.tfstate"
    region =  "eu-central-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]

}