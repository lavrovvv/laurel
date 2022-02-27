// Default AWS provider vars
variable "region" {
  type        = string
  description = "AWS Region"
}

variable "ami_id" {
  type        = string
  description = "AWS AMI"
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
variable "on_demand_base_capacity" {
    type = number
    description = ""
}

variable "on_demand_percentage_above_base_capacity" {
    type = number
    description = ""
}

variable "spot_allocation_strategy" {
    type = string
    description = ""
}

variable "spot_instance_pools" {
    type = number
    description = ""
}

variable "override_type_1" {
    type = string
    description = "Specify instance type for asg (t2.micro, etc)"
}

variable "weighted_capacity_1" {
    type = string
    description = "Specify instance type for asg (t2.micro, etc)"
}
