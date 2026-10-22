
# AccuKnox DevOps Trainee Assignment

## Project Overview

This repository contains my solutions for the AccuKnox DevOps Trainee Assignment.

The assignment includes two problem statements focused on application containerization, Kubernetes deployment, CI/CD automation, and Bash scripting.

## Problem Statement 1: Wisecow Application Deployment

Containerized the Wisecow application using Docker and deployed it on K3s Kubernetes running on AWS EC2.

### Tools and Technologies

- Linux (Ubuntu)
- Git and GitHub
- Docker and Docker Hub
- Kubernetes (K3s)
- GitHub Actions
- AWS EC2
- SSH
- Kubernetes Ingress and TLS

### Implementation

- Created a Dockerfile to containerize the Wisecow application.
- Created Kubernetes Deployment, Service, and Ingress manifests.
- Pushed Docker images to Docker Hub.
- Configured GitHub Actions to automate Docker image builds and pushes.
- Configured automated Kubernetes deployment through SSH.
- Enabled HTTPS using a self-signed TLS certificate.
- Tested application accessibility through HTTP and HTTPS.

### Application Access

HTTP: http://52.71.87.27/

HTTPS: https://52.71.87.27/

Note: The application URLs work only when the EC2 instance and required services are running. HTTPS uses a self-signed certificate.

### Project Files

[View Problem Statement 1 - Wisecow](./Problem-Statement-1-Wisecow/)

Docker Hub: https://hub.docker.com/r/snehalatha04/wisecow

Original Wisecow Project: https://github.com/nyrahul/wisecow

## Problem Statement 2: Bash Scripting

Selected two objectives from the assignment to implement using Bash scripting.

### Task 1: System Health Monitoring Script

Developed a Bash script to monitor Linux system health.

The script checks:

- CPU usage
- Memory usage
- Disk usage
- Running processes

It compares system metrics with predefined thresholds and displays warnings when thresholds are exceeded.

### Task 2: Application Health Checker

A Bash script to check whether an application is accessible using HTTP response status codes.

The script is intended to identify whether an application is UP or DOWN.

### Project Files

[View Problem Statement 2 - Bash Scripting](./Problem-Statement-2-Bash-Scripting/)

## CI/CD Automation

The GitHub Actions workflow automates:

1. Source code checkout.
2. Docker image build.
3. Docker Hub image push.
4. SSH connection to the deployment EC2 instance.
5. Kubernetes deployment update and rollout verification.

Workflow: `.github/workflows/ci-cd.yaml`

GitHub Actions: https://github.com/snehalathabathala04-cods/wisecow/actions

## Repository Structure

    wisecow/
    ├── .github/
    │   └── workflows/
    │       └── ci-cd.yaml
    ├── Problem-Statement-1-Wisecow/
    │   ├── Dockerfile
    │   ├── wisecow.sh
    │   ├── deployment.yaml
    │   ├── service.yaml
    │   ├── ingress.yaml
    │   └── README.md
    ├── Problem-Statement-2-Bash-Scripting/
    │   ├── system_health.sh
    │   └── README.md
    └── README.md

## Conclusion

This assignment demonstrates practical experience with Docker containerization, Kubernetes deployment, GitHub Actions CI/CD automation, Linux system monitoring, and Bash scripting.

