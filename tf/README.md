# Infrastructure for Quite Good app

This README provides instructions on deploying the "ReallyNotBad" Flask application to AWS Elastic Container Service (ECS) using Terraform. The deployment includes HTTPS support over port ``8089``

## Prerequisites

- AWS Account: Access to an AWS account with permissions to create the required resources.
- AWS CLI: Installed and configured with your AWS credentials.
- Terraform: Installed (version 1.0 or higher recommended).

## Architecture Overview

The Terraform configuration will deploy the Flask application using the following AWS services:

- Amazon ECS: For running Docker containers using AWS Fargate.
- Application Load Balancer (ALB): For distributing incoming HTTP traffic over port 8089.
- AWS VPC: A Virtual Private Cloud with public subnets.
- Security Groups: For controlling network access to the ALB and ECS tasks.

## Variables

You need to provide values for the following variables:

- ``aws_region``: AWS region for resource deployment (e.g., us-east-1).
- ``vpc_cidr_block``: CIDR block for the VPC (e.g., 10.0.0.0/16).
- ``public_subnets_cidr_blocks``: List of CIDR blocks for public subnets.
- ``app_port``: Port on which the Flask app listens (8089).
- ``docker_image``: Docker image URI (e.g., your-dockerhub-username/flask-app:latest).
- ``manage_task_definition``: Whether to manage the ECS task definition in Terraform (true or false).

---

## Setup Instructions

1. Install Terraform
If you haven't installed Terraform, download and install it from the official website - [https://www.terraform.io/](https://www.terraform.io/)

2. Install AWS CLI
If you haven't installed Terraform, download and install it from the official website - [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/)

3. Configure AWS Credentials
Ensure your AWS credentials are configured. You can use the AWS CLI or set environment variables:

    ```bash
    export AWS_ACCESS_KEY_ID="your_access_key_id"
    export AWS_SECRET_ACCESS_KEY="your_secret_access_key"
    export AWS_DEFAULT_REGION="your_aws_region"
    ```

4. Update Terraform Variables
Create a ``terraform.tfvars`` file or update variable values accordingly.
Example ``terraform.tfvars``:

    ```hcl
    aws_region = "us-east-1"
    vpc_cidr_block = "10.0.0.0/16"
    public_subnets_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
    app_port = 8089
    docker_image = "your-dockerhub-username/flask-app:latest"
    domain_name = "app.example.com"
    route53_zone_id = "Z1234567890ABCDEF"
    manage_task_definition = false
    ```

    **Note:** Replace the placeholder values with your actual information.

5. Initialize Terraform
Initialize the Terraform working directory:

    ```bash
    terraform init
    ```

6. Review the Execution Plan
Preview the actions Terraform will take:

    ```bash
    terraform plan
    ```

    Ensure that the plan looks correct.

7. Apply the Terraform Configuration
Deploy the infrastructure:

    ```bash
    terraform apply
    ```

   Type **yes** when prompted to confirm the deployment.

## Deploying the application

The deployment is being handled by GitHub Actions. New version of application is builded and deployed on every push to master branch.

## Clean Up Resources

To avoid incurring charges, destroy the resources when no longer needed:

```bash
terraform destroy
```

Type **yes** when prompted.
