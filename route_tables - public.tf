
resource "aws_route_table" "RTpublic" {
	vpc_id = "${aws_vpc.myvpc.id}"
	
route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.myvpcigw.id}"
     }
 
 tags = {
 	name = "myvpc-public-routetable"
	}
}



resource "aws_route_table_association" "public" {
	subnet_id = "${aws_subnet.publicsubnet[1].id}"
	route_table_id = "${aws_route_table.RTpublic.id}"
}


