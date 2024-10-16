variable "aws_region" {
  description = "AWS region to deploy the resources"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_port" {
  description = "Port on which the Flask app listens"
  default     = 8089
}

variable "docker_image" {
  description = "Docker image to deploy"
  default     = "ghcr.io/keijoraamat/quite_good:latest"
}

variable "github_repo" {
  description = "GitHub repository in the format owner/repo"
  default     = "keijoraamat/quite_good"
}