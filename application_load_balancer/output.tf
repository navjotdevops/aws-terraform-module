output "alb_arn" {
	value = "${aws_alb.alb.arn}"
}

output "alb_arn_for_cloudwatch_alarm" {
	value = "${replace(element(split(":", aws_alb.alb.arn),5), "loadbalancer/", "")}"
}

output "alb_dns" {
	value = "${aws_alb.alb.dns_name}"
}

