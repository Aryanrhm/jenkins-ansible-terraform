variable "name" {
  description = "The name to use for creating the resources"
  type = string
}

#### Security Group ####

variable "sg_name" {
  description = "The name of Security Group to create"
  type = string
}

variable "sg_ingress_ports" {
  type = list(number)
  description = "The ports to allow on the securityu group"
}

#### EC2 Instance ####

variable "ami_id" {
  type = string
}

variable "ec2_instance_type" {
  type = string
  default = "t2_micro"
}

variable "user_data" {
  type = bool
  description = "To specify a user data file for the instance"
}

#### Key Pairs ####
variable "key_name" {
}

variable "pem_file_name" {
  description = "The name of pem file which would be created locally"
  type = string
}

#### IAM Role ####

variable "iam_role_policy" {
  type = bool
  description = "To specify the iam-role-policy file for the iam role."
}

#### Other Resources ####

variable "ec2_eip" {
  type = bool
  description = "To have an eip for the instance" 
}
variable "ec2_extra_ebs" {
  type = bool
  description = "To have an extra ebs for the instance" 
}
variable "tg_attach" {
  type = bool
  description = "To attach the instance to a target group"
}

variable "tg_port" {
}

variable "ebs_size" {
}

variable "ebs_az" {
  type = string
}

variable "role_name" {
}

variable "tg_arn" {
}

variable "ebs_device_name" {
}