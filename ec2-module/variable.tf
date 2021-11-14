variable "AMI_ID" {
  description = "AMI ID used to provision ec2 instance"
  default     = "ami-02e136e904f3da870"
  type        = string
}

variable "instancetype" {
  description = "Instance Type"
  default     = "t2.micro"
  type        = string
}

variable "az" {
  description = "Availability Zone"
  default     = "us-east-1a"
  type        = string
}

variable "keyname" {
  description = "Key pair used to connect to the ec2 instance"
  default     = "Jenkins"
  type        = string
}

variable "securitygroups" {
  description = "List of security groups to be attached to the instance"
  default     = ["sg-083a80f6919f9a2e1"]
  type        = list(string)
}

variable "subnetid" {
  description = "Subnet where the instance is to be provisioned"
  default     = "subnet-5ef7ab38"
  type        = string
}

variable "publicip" {
  description = "Assing public IP to the instance"
  default     = true
  type        = bool
}

variable "tag" {
  description = "Tags that needs to be applied to the instances"
  default = {
    Name        = "TerraformInstance1"
    Description = "Created by Terraform"
  }
  type = map(string)
}
variable "instancecount" {
  default     = 1
  description = "number of ec2 instances to be provisioned"
  type        = number
}

variable "ebsvolumes" {
  description = "Storage volumes that needs to be attached to instances"
  type        = list(map(string))
  default     = []
}
variable "moduleec2instance" {
  type = object({
    instancetype   = string
    instancecount  = number
    publicip       = bool
    keyname        = string
    securitygroups = list(string)
    az             = string
    tag            = map(string)
  })
}


