data "aws_ami" "amazonlinux" {
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20211001.1-x86_64-gp2"]
  }
}

data "aws_vpc" "defaultvpc" {
  filter {
    name   = "vpc-id"
    values = ["vpc-565d352b"]
  }
}
data "aws_subnet" "subnetid" {
  filter {
    name   = "availability-zone"
    values = ["us-east-1a"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.defaultvpc.id]
  }
}