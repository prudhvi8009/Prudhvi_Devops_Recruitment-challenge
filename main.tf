provider "aws" {
  region = "us-east-1" # Modify this with your desired region
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster"
}

resource "aws_ecs_task_definition" "my_app" {
  family                   = "my-app"
  network_mode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name  = "my-app-container"
      image = "your-docker-image-from-docker-hub:latest"
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      environment = [
        {
          name  = "APIKEY"
          value = "1997-07-16T00:00:00Z"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "my_app_service" {
  name            = "my-app-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_app.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = ["subnet-xxxxxxxxxx"] # Replace with your subnet IDs
    security_groups = ["sg-xxxxxxxxxx"] # Replace with your security group IDs
  }

  depends_on = [aws_ecs_task_definition.my_app]
}

output "my_app_endpoint" {
  value = aws_ecs_service.my_app_service.load_balancers[0].dns_name
}
