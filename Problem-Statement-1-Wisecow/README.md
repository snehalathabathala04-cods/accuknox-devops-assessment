# Wisecow Application – DevOps Assignment

## Project Overview

This project is part of the AccuKnox DevOps assignment. The goal is to containerize the Wisecow application using Docker, deploy it on Kubernetes, and automate the build and deployment process using GitHub Actions.

The application runs on an AWS EC2 Ubuntu server using K3s Kubernetes.

**Original Project:** https://github.com/nyrahul/wisecow

**GitHub Repository:** https://github.com/snehalathabathala04-cods/wisecow

## Tools and Technologies

- **Git and GitHub:** To manage the source code and CI/CD workflow.
- **Docker:** To build and containerize the Wisecow application.
- **Docker Hub:** To store and manage Docker images.
- **Kubernetes (K3s):** To deploy and manage the application.
- **GitHub Actions:** To automate the build, push, and deployment process.
- **AWS EC2 (Ubuntu):** To host the Kubernetes environment.
- **SSH:** To connect GitHub Actions to the EC2 server for deployment.
- **Kubernetes Ingress:** To expose the application through HTTP and HTTPS.

## Project Files

| File | Purpose |
|---|---|
| `wisecow.sh` | Original Wisecow application |
| `Dockerfile` | Builds the Docker image |
| `deployment.yaml` | Deploys the application on Kubernetes |
| `service.yaml` | Exposes the application through a Kubernetes Service |
| `ingress.yaml` | Configures application access and TLS |
| `.github/workflows/ci-cd.yaml` | Automates Docker build, push, and Kubernetes deployment |
| `README.md` | Contains project documentation and deployment steps |

## 1. Docker Containerization

I created a Dockerfile to containerize the Wisecow application with its required dependencies.

The Docker image contains the application script and the packages required to run it.

**To build the Docker image:**

```bash
docker build -t wisecow:latest ./Problem-Statement-1-Wisecow
```

**To run the Docker container:**

```bash
docker run -d -p 4499:4499 --name wisecow wisecow:latest
```

**To check the running container:**

```bash
docker ps
```

**Docker Hub Image:** `snehalatha04/wisecow:latest`

## 2. Docker Hub Image Registry

I used Docker Hub to store the Wisecow Docker image.

I configured GitHub Actions to automatically build and push the Docker image to Docker Hub whenever changes are pushed to the `main` branch.

The image is pushed with two tags:

- **`latest`:** Represents the latest version of the application.
- **Commit SHA:** Identifies the image created from a specific GitHub commit.

**Docker Hub Repository and Image Tags:**

https://hub.docker.com/r/snehalatha04/wisecow/tags

**Docker Image:** `snehalatha04/wisecow:latest`

**To pull the image from Docker Hub:**

```bash
docker pull snehalatha04/wisecow:latest
```

Kubernetes uses the Docker Hub image to run the Wisecow application.

## 3. Kubernetes Deployment

I used K3s Kubernetes on an AWS EC2 Ubuntu instance to deploy the application.

I created Kubernetes manifest files for the Deployment, Service, and Ingress.

- **Deployment:** Manages the Wisecow application containers.
- **Service:** Exposes the application inside the Kubernetes environment.
- **Ingress:** Provides HTTP and HTTPS access to the application.

**To deploy the application:**

```bash
sudo k3s kubectl apply -f deployment.yaml
sudo k3s kubectl apply -f service.yaml
sudo k3s kubectl apply -f ingress.yaml
```

**To check the deployment status:**

```bash
sudo k3s kubectl get pods
sudo k3s kubectl get deployments
sudo k3s kubectl get services
sudo k3s kubectl get ingress
```

The application is exposed through a Kubernetes Service and is accessible using Ingress.

## 4. CI/CD Using GitHub Actions

I configured a GitHub Actions workflow to automate the Docker image build and Kubernetes deployment.

### Continuous Integration (CI)

Whenever changes are pushed to the `main` branch, GitHub Actions:

1. Checks out the source code from GitHub.
2. Sets up Docker Buildx.
3. Logs in to Docker Hub using GitHub Actions Secrets.
4. Builds the Docker image.
5. Pushes the image to Docker Hub with `latest` and commit SHA tags.

### Continuous Deployment (CD)

After a successful Docker image build:

1. GitHub Actions connects to the AWS EC2 instance using SSH.
2. Updates the Kubernetes Deployment with the newly built Docker image.
3. Waits for the Kubernetes rollout to complete.

This process helps automate application updates without manually deploying every new version.

The workflow uses GitHub Actions Secrets to store credentials securely.

**Workflow File:** `.github/workflows/ci-cd.yaml`

**GitHub Actions Workflow:**

https://github.com/snehalathabathala04-cods/wisecow/actions

## 5. TLS Configuration

I configured TLS for the Wisecow application using Kubernetes Ingress and a self-signed certificate.

This enables HTTPS communication for testing.

I tested the application through HTTPS and confirmed that the Wisecow page loads successfully.

Since the certificate is self-signed, browsers may display a security warning because the certificate is not trusted by a public certificate authority.

For a production environment, a trusted TLS certificate and domain name would be recommended.

## 6. Application Access

The application is deployed on AWS EC2 and can be accessed using the following URLs while the instance is running and the network configuration allows access.

**HTTP URL:**

http://52.71.87.27/

**HTTPS URL:**

https://52.71.87.27/

The application displays a cow illustration with a random quote.

Each time the page is refreshed, the application may display a different quote.

**Note:** The HTTPS URL uses a self-signed certificate, so the browser may show a certificate warning.

## 7. Testing and Verification

I tested and verified the following:

- Docker image build and push using GitHub Actions.
- Docker image availability in Docker Hub.
- Successful execution of the CI/CD workflow.
- Kubernetes deployment through the automated workflow.
- Application accessibility through HTTP.
- HTTPS access using a self-signed TLS certificate.
- Wisecow application output in the browser.

## 8. Project Outcome

Through this project, I implemented the following:

- Containerized the Wisecow application using Docker.
- Stored the Docker images in Docker Hub.
- Deployed the application using K3s Kubernetes.
- Exposed the application using Kubernetes Service and Ingress.
- Automated Docker image builds and deployment using GitHub Actions.
- Configured HTTPS communication using a self-signed TLS certificate.
- Verified that the application is accessible through a web browser.

## Conclusion

I successfully containerized the Wisecow application using Docker and deployed it on Kubernetes.

I used Docker Hub to store the application images and implemented a GitHub Actions CI/CD pipeline to automate image builds, push images to Docker Hub, and deploy updates to Kubernetes.

I also configured TLS using a self-signed certificate and verified that the application works through HTTP and HTTPS.
