variable "aws_region" {
  description = "The AWS region where the infrastructure will be deployed."
  type        = string
  default     = "us-east-1" # Modify with your desired region
}

variable "ecs_subnet_ids" {
  description = "List of subnet IDs for ECS service."
  type        = list(string)
}

variable "ecs_security_group_ids" {
  description = "List of security group IDs for ECS service."
  type        = list(string)
}

variable "docker_image" {
  description = "Docker image from Docker Hub to deploy."
  type        = string
}

variable "api_key" {
  description = "The super-secret API key (ISO 8601 format)."
  type        = string
  default     = "1997-07-16T00:00:00Z" # Replace with your secret API key
}
