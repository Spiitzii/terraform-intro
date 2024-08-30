provider "aws" {
region = "eu-central-1"
}

resource "aws_vpc" "main_vpc_prod" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main-prod-vpc"
    }
}

# Internet Gateway

resource "aws_internet_gateway" "main_igw_prod" {
    vpc_id = aws_vpc.main_vpc_prod.id

    tags = {
        Name = "main-prod-igw"
    }
}

# Subnet

resource "aws_subnet" "main_public_subnet_a_prod" {
    vpc_id = aws_vpc.main_vpc_prod.id
    cidr_block = "10.0.0.0/20"
    availability_zone = "eu-central-1a"

    tags = {
        Name = "main-prod-subnet"
    }
}