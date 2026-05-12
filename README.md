<h2># 🚀 Terraform AWS Multi-Environment Infrastructure,</h2>

## 📌 Overview
This project is a Terraform-based Infrastructure as Code (IaC) setup to provision AWS infrastructure across multiple environments (Dev & Prod).

It follows a modular and reusable structure for scalable cloud deployment.

---

## 🏗️ Architecture Diagram:

<img width="777" height="262" alt="Image" src="https://github.com/user-attachments/assets/b3d0bfd8-2fa0-4a2a-87ee-80df89a1bef0" />

---

## 🏗️ Infrastructure Components:

- VPC (Networking with subnets & routing)
- EC2 Instances
- S3 Bucket
- DynamoDB
- Security Groups
- Key Pairs

---

## 📁 Project Structure
```
terraform-project/
│
├── Modules/
│ ├── vpc/
│ ├── ec2/
│ ├── s3/
│ ├── dynamodb/
│ └── SecurityGroup/
│
├── envs/
│ ├── dev/
│ └── prod/
│
├── keys/
├── scripts/
├── README.md
└── .gitignore
```

---

## 🌍 Environments

### Dev
- Used for development and testing
- Lightweight configuration

### Prod
- Production-ready setup
- High availability and scalability

---

## 🚀 Deployment Steps

### 1. Initialize Terraform
```terraform init```

### 2. Go to environment folder
```
cd envs/dev
cd envs/prod
```

### 4. Validate configuration
```
terraform validate
```
### 5. Plan infrastructure
```
terraform plan
```
### 7. Apply infrastructure
```
terraform apply -auto-approve
```
###  🔐 Security:

Terraform state files are ignored<br>
AWS keys are not committed<br>
Security groups restrict access<br>
Sensitive files excluded via .gitignore<br>

### 🧰 Prerequisites:
Terraform installed<br>
AWS CLI configured<br>
IAM permissions for required services<br>

###  📌 Features:
Multi-environment setup (Dev & Prod)<br>
Modular Terraform architecture<br>
Reusable infrastructure code<br>
Scalable AWS design<br>

### 👨‍💻 Author

Ankit Rana
DevOps & Cloud Enthusiast
AWS | Terraform | CI/CD | Kubernetes

⭐ Support

If you like this project, give it a ⭐ on GitHub
