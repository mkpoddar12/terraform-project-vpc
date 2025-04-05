resource "aws_vps" "main" {
	cide_block = var.vapc_cidr
	
	tags={
	Name=var.vpc_name
   }
}

resource "aws_subnet" "public" {
	count = length(var.public_subnets)

	vpc_id		= aws_vpc.main.id
	cidr_block	= element(var.public_subnets, count.index)
	availability_zone = element(var.availability_zones, count.index)

	tags = {
	Name = "${var.vpc_name}-public-${count.index}"
   }
}

resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.main.id

	tags = {
	Name= "${var.vpc_name}-igw"
    }
} 

resource "aws_route_table" "public" {
	vpc_id = aws_vpc.amain.id
	
	route{
	cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.igw.id
  }	
	tags = {
	Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
	count = length(var.public_subnets)
	subnet_id = element(aws_subnet.public.*.id, count.index)
	route_table_id = aws_route_table.public.id
}





