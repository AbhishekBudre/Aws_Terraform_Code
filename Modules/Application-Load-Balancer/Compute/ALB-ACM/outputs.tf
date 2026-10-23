output "certificate_arn" {

  value = aws_acm_certificate.alb_cert.arn
}

output "certificate_domain_name" {

  value = aws_acm_certificate.alb_cert.domain_name
}

output "certificate_status" {

  value = aws_acm_certificate.alb_cert.status
}