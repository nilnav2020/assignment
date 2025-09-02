## 📝 Introduction:

This project implements a secure, real-time chat application with a DevSecOps workflow.
It demonstrates how to integrate security controls across the application, infrastructure, and CI/CD pipeline.

. **Frontend**: React + TailwindCSS

. **Backend**: Node.js + Express + MongoDB + Socket.io

. **Infra**: Kubernetes (EKS)

. **Security**: Semgrep (SAST), Trivy (Image + SCA), Kyverno (K8s policies), Checkov (IaC scanning) - for s3 bucket

. **CI/CD**: Jenkins pipeline with automated build, scan, and deploy

## ✨ Application Features:


* **Real-time Messaging**: Send and receive messages instantly using Socket.io 
* **User Authentication & Authorization**: Securely manage user access with JWT 
* **Scalable & Secure Architecture**: Built to handle large volumes of traffic and data 
* **Modern UI Design**: A user-friendly interface crafted with React and TailwindCSS 
* **Profile Management**: Users can upload and update their profile pictures 
* **Online Status**: View real-time online/offline status of users 


## 🛠️ Tech Stack:


* **Backend:** Node.js, Express, MongoDB, Socket.io
* **Frontend:** React, TailwindCSS
* **Containerization:** Docker
* **Orchestration:** Kubernetes and docker compose
* **Web Server:** Nginx
* **State Management:** Zustand
* **Authentication:** JWT
* **Styling Components:** DaisyUI


## Repository Structure
```bash
.
├── backend/                 # Node.js backend source code
├── frontend/                # React frontend source code
├── docker-compose.yml       # for easier stack overall reference
├── k8s/                     # Kubernetes manifests (fe, be, db)
  ├── be
  │   ├── be-dep.yaml
  │   └── be-svc.yaml
  ├── db
  │   ├── db-dep.yaml
  │   ├── db-gp3.yaml
  │   ├── db-pvc.yml
  │   └── db-svc.yaml
  └── fe
      ├── fe-dep.yaml
      └── fe-svc.yaml
├── eso/                     # External Secrets Operator manifests
├── kyverno/                 # Kyverno policies (restrict privileged pods, enforce resource limits)
├── terraform/               # Terraform IaC (S3 bucket + encryption)
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── Jenkinsfile              # CI/CD pipeline definition
├── Security-Report.pdf      # Compliance & Security report
└── README.md                
```

### Clone the Repository

```bash
git clone https://github.com/nilnav2020/assignment.git
```

## Build and Run the Application

Follow these steps to build and run the application:

```bash
cd full-stack_chatApp
```
**internal deployments**
```bash
docker-compose up -d --build
```

2. Access the application in your browser:

```
http://localhost
```
You can now interact with the real-time chat app and start messaging.

**Kubernetes Deployment (EKS)**

Update kubeconfig:

aws eks update-kubeconfig --name chat-app-cluster --region us-east-1


Apply External Secrets + Kyverno:
```bash
kubectl apply -f eso/
kubectl apply -f kyverno/
```

Deploy application:
```bash
kubectl apply -R -f k8s/
```

**CI/CD Pipeline (Jenkins)**

**configure Jenkins server**

__Configure IAM role for Jenkins EC2 to allow__
1. eks:DescribeCluster
2. eks:UpdateClusterConfig
3. sts:AssumeRole
__Configure Jenkins credentials__

1. Git credentials (git)
2. GitHub Container Registry credentials (ghcr-creds)

Stages:
1. **Checkout Code**
2. **Semgrep SAST (static analysis)**
3. **Unit Tests (frontend + backend)**
4. **Build & Push Docker Images → GHCR**
5. **Trivy Image Scanning (fail if CRITICAL > 25)**
6. **Trivy FS SCA (frontend + backend dependency scanning)**
7. **Kyverno Policy Deployment**
8. **Kubernetes Deployment → EKS**
9. **Rollout Verification**






