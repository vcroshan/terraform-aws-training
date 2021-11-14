terraform {
  required_providers {
    aws = {
      version = "<= 3.65.0"
      }
  }
  backend "local" {}
}

variable "moduleec2instance" {
  type = map(object({
    instancetype   = string
    instancecount  = number
    publicip       = bool
    keyname        = string
    securitygroups = list(string)
    az             = string
    tag            = map(string)
  }))
  default = {
    instance1 = {
      instancetype   = "t2.micro"
      instancecount  = 2
      publicip       = "true"
      keyname        = "Jenkins"
      securitygroups = ["sg-083a80f6919f9a2e1"]
      az             = "us-east-1a"
      tag = {
        Name        = "TerraformInstance1"
        Description = "Created by Terraform"
      }
    },
    instance2 = {
      instancetype   = "t2.micro"
      instancecount  = 1
      publicip       = "true"
      keyname        = "Jenkins"
      securitygroups = ["sg-083a80f6919f9a2e1"]
      az             = "us-east-1a"
      tag = {
        Name        = "TerraformInstance2"
        Description = "Created by Terraform"
      }
    }
  }
}
module "ec2instance" {
  for_each          = var.moduleec2instance
  source            = "./ec2-module/"
  moduleec2instance = each.value
}

locals{
  ec2ips = [ for k,v in module.ec2instance : [for i, j in v : join(", ",j)] ]
  #ec2ips = [ for k,v in module.ec2instance : v ]
  #ec2ips1 = join(",", local.ec2ips[0])
  #ec2ips1 = [for i in local.ec2ips : i]
}

output "ec2-ip" {
  value = join(",",flatten(local.ec2ips))
  #value = local.ec2ips
}
output "privateips" {
  value = module.ec2instance
}