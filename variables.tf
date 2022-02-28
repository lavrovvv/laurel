// Default AWS provider vars
variable "region" {
  type        = string
  description = "AWS Region"
}

variable "ami_id" {
  type        = string
  description = "AWS AMI"
}

variable "profile" {
  type        = string
  description = "set profile"
}

variable "asg_name" {
  type        = string
  description = "Auto Scaling Group name"
}

variable "lc_name" {
  type        = string
  description = "Launch configuration name"
}

# variable "security_groups" {
#     type = list(string)
#     description = "Specify security group list"
# }

variable "max_size" {
  type = number
    description = "Max size of autoscale group"
}

variable "min_size" {
  type = number
    description = "Min size of autoscale group"
}

variable "vpc_zone" {
  type = list(string)
    description = "Specify subnet"
}

variable "key_name" {
  type = string
    description = "Specify SSH key for access to AWS instances"
}

// Mixed instances policy part

variable "desired_capacity" {
    type = number
    description = ""
  
}