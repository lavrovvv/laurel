// Set-up main info
region = "eu-west-1"
ami_id = "ami-0bf84c42e04519c85"

// Set-up Auto Scaling Group
asg_name = "DDoS-scale"
desired_capacity = 0
vpc_zone = ["subnet-b9c398e3", "subnet-8d657ceb", "subnet-deb85095" ]
min_size = 0
max_size = 4


// Set-up launch configuration
lc_name = "DDoS-lc"
key_name = "123"

// Set-up mixed ASG
on_demand_base_capacity                  = 4
on_demand_percentage_above_base_capacity = 0
spot_allocation_strategy                 = "lowest-price"
spot_instance_pools                      = 2

// Instances override
override_type_1 = "t2.micro"
weighted_capacity_1 = null
