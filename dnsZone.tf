resource "aws_route53_record" "www" {

  zone_id = "Z02405372D0KHM545MHPC"
  name    = var.route53_public_dns_name
  type    = "A"
  alias {
    name                   = aws_elb.bar.dns_name
    zone_id                = aws_elb.bar.zone_id
    evaluate_target_health = false
  }
}
