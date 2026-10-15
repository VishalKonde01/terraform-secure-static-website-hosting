output "hosted_zone_id" {
  value = aws_route53_zone.primary.id
}

output "hosted_zone_arn"{
  value = aws_route53_zone.primary.arn
}

output "hosted_zone_id_name" {
  value = aws_route53_zone.primary.name
}

output "name_servers" {
  value = aws_route53_zone.primary.name_servers
}