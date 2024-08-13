module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.12.0"

    name = "steamscraper-vpc"
    # main subnet
    cidr = "172.24.0.0/16"
    # takes the first three available zones 
    azs = slice(data.aws_availability_zones.available.names, 0, 3)
    
    private_subnets = ["172.24.1.0/24", "172.24.2.0/24", "172.24.3.0/24"]
    public_subnets = ["172.24.4.0/24", "172.24.5.0/24", "172.24.6.0/24"]

    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true

}