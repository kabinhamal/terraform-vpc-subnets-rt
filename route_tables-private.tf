
resource "aws_route_table" "RTprivate" {
	vpc_id = "${aws_vpc.myvpc.id}"
	
route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_nat_gateway.NATgw.id}"
     }
 
 tags = {
 	name = "myvpcprivateroute-table"
	}
}



resource "aws_route_table_association" "private" {
	subnet_id = "${aws_subnet.privatesubnet[1].id}"
	route_table_id = "${aws_route_table.RTprivate.id}"
}


