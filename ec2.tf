resource "aws_instance" "PublicEc2"{
    ami = "ami-010aff33ed5991201"
    instance_type = "t2.micro"
    
    vpc_security_group_ids = [ "${aws_security_group.allow_ssh.id}"]
    subnet_id = "${aws_subnet.PublicSubnet_A.id}"
    key_name = "picsa"
    tags = {
        Name = "PublicEc2"
    }
    depends_on = [aws_vpc.mainvpc,aws_subnet.PublicSubnet_A,aws_security_group.allow_ssh]
}

resource "aws_instance" "PrivateEc2"{
    ami = "ami-06a0b4e3b7eb7a300"
    instance_type = "t2.micro"
    
    vpc_security_group_ids = [ "${aws_security_group.allow_ssh.id}"]
    subnet_id = "${aws_subnet.PrivateSubnet_A.id}"
    key_name = "picsa"
    tags = {
        Name = "PrivateEc2"
    }
    depends_on = [aws_vpc.mainvpc,aws_subnet.PrivateSubnet_A,aws_security_group.allow_ssh]
}

