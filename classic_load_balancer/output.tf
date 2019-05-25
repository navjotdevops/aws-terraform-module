output "name" {
	value = "${aws_elb.classic_elb.name}"
}

output "dns_name" {
	value = "${aws_elb.classic_elb.dns_name}"
}
