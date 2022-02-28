// Set-up main info
region = "eu-west-1"
ami_id = "ami-0bf84c42e04519c85"
profile = "default"

// Set-up Auto Scaling Group
asg_name = "Laurel-scale"
desired_capacity = 1
vpc_zone = []
min_size = 0
max_size = 32


// Set-up launch configuration
lc_name = "Laurel-lc"
key_name = "123"
