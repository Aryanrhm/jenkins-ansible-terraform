
#  source   = "git::https://github.com/Aryanrhm/aws-terraform-modules.git//services/security_group"

module "iam_role_create" {
  source       = "../aws-terraform-modules/services/iam_role"
  name = var.name
  iam_role_policy = var.iam_role_policy
}

module "security_group" {
  source   = "../aws-terraform-modules/services/security_group"
  name  = var.sg_name
  ports = var.sg_ingress_ports
}


module "key_pairs" {
  name = var.key_name
  pem_file_name = var.pem_file_name
  source = "../aws-terraform-modules/services/key_pairs"
}


module "ec2_instance" {
  source        = "../aws-terraform-modules/services/ec2_instance"
  pem_file_name = var.pem_file_name

  name  = var.name
  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  eip           = var.ec2_eip
  extra_ebs     = var.ec2_extra_ebs
  sg_id  = module.security_group.id
  key_name        = module.key_pairs.name
  tg_attach     = var.tg_attach
  tg_port = var.tg_port
  ebs_size = var.ebs_size
  ebs_az = var.ebs_az
  role_name = var.role_name
  tg_arn = var.tg_arn
  ebs_device_name = var.ebs_device_name
  user_data = var.user_data
  depends_on = [
    module.security_group, module.key_pairs
  ]
}

resource "null_resource" "null" {

  provisioner "remote-exec" {
  inline = ["sudo apt update" , "echo Done!"]

  connection {
    host        = module.ec2_instance.instance_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.pem_file_name)
  }
}

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${module.ec2_instance.instance_ip},' --private-key ${var.pem_file_name}  jenkins.yml"
  }
}


