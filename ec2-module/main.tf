
/*resource "aws_instance" "myec2instance" {
  count = var.instancecount
  ami                         = data.aws_ami.amazonlinux.id
  instance_type               = var.instancetype
  associate_public_ip_address = var.publicip
  availability_zone           = var.az
  key_name                    = var.keyname
  vpc_security_group_ids             = var.securitygroups
  subnet_id                   = data.aws_subnet.subnetid.id
  tags = var.tag
  dynamic "ebs_block_device" {
   for_each = var.ebsvolumes
    content {
      device_name = ebs_block_device.value.devicename
      volume_size = ebs_block_device.value.volumesize
      delete_on_termination = ebs_block_device.value.deleteontermination
    }
  }
}*/


resource "aws_instance" "myec2instance" {
  count                       = var.moduleec2instance.instancecount
  ami                         = data.aws_ami.amazonlinux.id
  instance_type               = var.moduleec2instance.instancetype
  associate_public_ip_address = var.moduleec2instance.publicip
  key_name                    = var.moduleec2instance.keyname
  availability_zone           = var.moduleec2instance.az
  vpc_security_group_ids      = var.moduleec2instance.securitygroups
  subnet_id                   = data.aws_subnet.subnetid.id
  tags                        = var.moduleec2instance.tag
}

