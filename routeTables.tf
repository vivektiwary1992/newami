# Declare the data source
/* EXTERNAL NETWORG , IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "ion-vpc-igw"
  }
}
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "PublicRT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
#resource "aws_eip" "forNat" {
#  vpc = true
#}
#resource "aws_nat_gateway" "PublicAZA" {
#allocation_id = aws_eip.forNat.id
#subnet_id     = aws_subnet.PublicAZA.id
#depends_on    = [aws_internet_gateway.gw]
#}
resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "PrivateRT"
  }
  #  route {
  #    cidr_block     = "0.0.0.0/0"
  #    nat_gateway_id = aws_nat_gateway.PublicAZA.id
  #  }
}
