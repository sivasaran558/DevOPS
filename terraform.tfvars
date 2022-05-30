aws_region  = "us-east-1"
vpc_name    = "FunctionsVPC"
vpc_cidr    = "10.66.0.0/16"
vpc_owner   = "Siva"
environment = "dev"


availability_zone = ["us-east-1a", "us-east-1b", "us-east-1c"]

public_cidr_blocks  = ["10.66.1.0/24", "10.66.2.0/24", "10.66.3.0/24"]
private_cidr_blocks = ["10.66.10.0/24", "10.66.20.0/24", "10.66.30.0/24"]
instance_type       = "t2.nano"
imagename           = "ami-0c4f7023847b90238"
key_name            = "Siva_AWS_terraform"

amis = {
  us-east-1  = "ami-0c4f7023847b90238"
  use-east-2 = "ami-0eea504f45ef7a8f7"
}


