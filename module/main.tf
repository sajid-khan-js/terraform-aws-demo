provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"

  cidr = "10.0.0.0/16"

  # Used to split subnets: http://www.davidc.net/sites/default/subnets/subnets.html?network=10.0.0.0&mask=16&division=15.7231
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  private_subnets = ["10.0.128.0/19", "10.0.160.0/19", "10.0.192.0/19"]


  enable_ipv6 = false

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true


  tags = {
    Owner       = "teamemail@company.com"
    Environment = "dev"
    Cost_Centre = "1234"
  }
}


