# "Quite good" Flask App

This repository contains a simple Python Flask web application that listens on port ``8089``. The app responds with ``"ReallyNotBad"`` when it receives a ``POST`` request containing the header ``"NotBad"`` with the value ``"true"``.

## Prerequisites

- **Python 3.6 or higher**
- **pip** (Python package installer)
- **Docker** (optional, for containerization)
- **AWS Account** (optional, for deployment)
- **GitHub Account** (optional, for CI/CD pipeline)

## Installation

### Clone the Repository

```bash
git clone https://github.com/keijoraamat/quite_good.git
cd quite_good
```

### Create a Virtual Environment

It's recommended to use a virtual environment to manage dependencies.

```bash
python3 -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
```

### Install Dependencies

Install the required Python packages using ``pip``:

```bash
pip install -r requirements.txt
```

---

## Running the App Locally

### Starting the App

Run the Flask application:`

```bash
python app.py
```

The app will start and listen on port ``8089``.

## Testing the App

You can test the application using ``curl`` commands.

### Valid Request

```bash
curl -X POST -H "NotBad: true" http://localhost:8089/
```

#### Expected Response

```bash
ReallyNotBad
```

### Invalid Request (Missing or Incorrect Header)

```bash
curl -X POST http://localhost:8089/
```

#### Expected Response

```bash
Invalid header value
```

## Deployment

### AWS ECS Deployment

For deploying the app to AWS Elastic Container Service (ECS), refer to the accompanying Terraform configuration in the ``tf`` directory. The Terraform scripts set up the necessary AWS resources, including ECS clusters, task definitions, and load balancers.

#### Key Steps

1. **Build and Push Docker Image to ECR or Docker Hub.**
2. **Configure Terraform Variables with AWS and application details.**
3. **Deploy using Terraform.**

### GitHub Actions CI/CD Pipeline

Automate deployment using GitHub Actions with OpenID Connect (OIDC) authentication to AWS.

#### Key Components

- **Workflow File**: ``.github/workflows/main.yml``
- **AWS IAM Role**: With permissions for ECS, and trust policy for GitHub OIDC.
- **Task Definition**: Managed via the GitHub Actions workflow.

#### Benefits

- **Secure Authentication**: No need to store AWS credentials in GitHub secrets.
- **Automated Deployments**: On push to the main branch or via pull requests.
- **Consistent Environment**: Ensures that the same Docker image is deployed.

## License

This project is licensed under the [MIT License](LICENSE).
