variable "region"{
	default= "us-east-2"
}
 

variable "vpc_cidr"{
	default = "190.160.0.0/16"
}


variable "subnet_cidr" {
	type = list(string)
	default = ["190.160.0.0/24", "190.160.1.0/24"]
	}

variable"azs" {
	type = list(string)
	default = ["us-east-2a", "us-east-2b"]
}

variable "privatesubnet_cidr" {
	type = list(string)
	default = ["190.160.2.0/24", "190.160.3.0/24"]
	}

variable"privateazs" {
	type = list(string)
	default = ["us-east-2a", "us-east-2b"]
}