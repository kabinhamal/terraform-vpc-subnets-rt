

resource "aws_internet_gateway" "myvpcigw" {
  vpc_id = "${aws_vpc.myvpc.id}"
   tags = {
	Name = "myvpcigw"
}
}

resource "aws_eip" "natEIP" {
   vpc   = true
   depends_on = [aws_internet_gateway.myvpcigw]
 }

 resource "aws_nat_gateway" "NATgw" {
   allocation_id = "${aws_eip.natEIP.id}"
   subnet_id = "${aws_subnet.publicsubnet[1].id}"

   tags = {
      name = " myvpc-nat-gateway"
     }
}





