provider "aws" {

  region     = "${var.region}"
  
}



resource "aws_vpc" "myvpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "my_vpc"
  }
}


resource "aws_subnet" "publicsubnet" {
  count =      "${length(var.azs)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"

  tags = {
    Name = "myvpcpublicsubnet-${count.index+1}"
  }
}

resource "aws_subnet" "privatesubnet" {
  count =      "${length(var.privateazs)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${element(var.privatesubnet_cidr,count.index)}"

  tags = {
    Name = "myvpcprivatesubnet-${count.index+1}"
  }
}








