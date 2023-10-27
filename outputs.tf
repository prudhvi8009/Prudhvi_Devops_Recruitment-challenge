output "my_app_endpoint" {
  description = "The URL to access your deployed web application."
  value       = aws_ecs_service.my_app_service.load_balancers[0].dns_name
}