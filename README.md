# Wisecow Application – DevOps Assignment

## Project Overview

This project is part of the AccuKnox DevOps assignment. The goal is to containerize the Wisecow application using Docker, deploy it on Kubernetes, and automate the build and deployment process using GitHub Actions.

The application runs on an AWS EC2 Ubuntu server using K3s Kubernetes.

**Original Project:** https://github.com/nyrahul/wisecow

## Tools and Technologies

- **Git and GitHub:** To manage the source code and CI/CD workflow.
- **Docker:** To build and containerize the Wisecow application.
- **Docker Hub:** To store the Docker images.
- **Kubernetes (K3s):** To deploy and manage the application.
- **GitHub Actions:** To automate the build, push, and deployment process.
- **AWS EC2 (Ubuntu):** To host the Kubernetes environment.

## Project Files

| File | Purpose |
|---|---|
| `wisecow.sh` | Original Wisecow application |
| `Dockerfile` | Builds the Docker image |
| `deployment.yaml` | Deploys the application on Kubernetes |
| `service.yaml` | Exposes the application through a Kubernetes Service |
| `ingress.yaml` | Configures application access and TLS |
| `.github/workflows/ci-cd.yaml` | Automates Docker build, push, and Kubernetes deployment |

## 1. Docker Containerization

I created a Dockerfile to containerize the Wisecow application with its required dependencies.

To build the Docker image:

```bash
docker build -t wisecow:latest .
```

To run the Docker container:

```bash
docker run -d -p 4499:4499 --name wisecow wisecow:latest
```

**Docker Hub Image:** `snehalatha04/wisecow:latest`

## 2. Kubernetes Deployment

I used K3s Kubernetes on an AWS EC2 Ubuntu instance to deploy the application.

I created Kubernetes manifest files for the Deployment, Service, and Ingress.

To deploy the application:

```bash
sudo k3s kubectl apply -f deployment.yaml
sudo k3s kubectl apply -f service.yaml
sudo k3s kubectl apply -f ingress.yaml
```

To check the deployment status:

```bash
sudo k3s kubectl get pods
sudo k3s kubectl get deployments
sudo k3s kubectl get services
sudo k3s kubectl get ingress
```

The application is exposed through a Kubernetes Service and is accessible using Ingress.

## 3. CI/CD Using GitHub Actions

I configured a GitHub Actions workflow to automate the Docker image build and Kubernetes deployment.

**Continuous Integration (CI):**

Whenever changes are pushed to the `main` branch, GitHub Actions:

1. Checks out the source code.
2. Builds the Docker image.
3. Pushes the image to Docker Hub with `latest` and commit SHA tags.

**Continuous Deployment (CD):**

After a successful image build:

1. GitHub Actions connects to the AWS EC2 instance using SSH.
2. Updates the Kubernetes Deployment with the new Docker image.
3. Waits for the Kubernetes rollout to complete.

The workflow uses GitHub Actions Secrets to store credentials securely.

**Workflow File:** `.github/workflows/ci-cd.yaml`

## 4. TLS Configuration

I configured TLS for the Wisecow application using Kubernetes Ingress and a self-signed certificate.

This enables HTTPS communication for testing. Since the certificate is self-signed, browsers may display a security warning.

## 5. Application Access

The application is deployed on AWS EC2 and can be accessed using the following URL while the instance is running:

**Application URL:** http://52.71.87.27/

The application displays a cow illustration with a random quote.

## 6. Testing and Verification

I verified the following:

- Docker image build and push using GitHub Actions.
- Successful execution of the CI/CD workflow.
- Kubernetes deployment through the automated workflow.
- Application accessibility through the browser.

## Conclusion

I successfully containerized the Wisecow application using Docker and deployed it on Kubernetes.

I also implemented a GitHub Actions CI/CD pipeline to automate Docker image builds, push images to Docker Hub, and deploy updates to Kubernetes.

TLS was configured using a self-signed certificate for HTTPS testing.
