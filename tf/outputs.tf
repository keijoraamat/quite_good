output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.alb.dns_name
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions_role.arn
}
