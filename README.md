# 🚀 Tech Eazy DevOps – EC2 Deployment Automation using Terraform

This project automates the deployment of an AWS EC2 instance using **Terraform** and a **User Data script** that installs Java, Maven, clones a Spring Boot app from GitHub, builds it, and runs it automatically.

---

## 🧩 Project Overview

**Objective:**  
Automate the entire workflow of provisioning infrastructure and deploying an application on AWS EC2 using Terraform.

**Includes:**
- Multi-environment setup (Dev & Prod)
- EC2 instance provisioning
- User data automation (Java + Maven installation)
- Application auto-deployment from GitHub
- Clean destroy with `terraform destroy`

---

## 🛠️ Prerequisites

Before running this project, make sure you have:

1. **AWS Account** (with access key and secret key)
2. **AWS CLI** installed and configured  
   ```bash
   aws configure
Terraform installed

terraform -version
git --version




📂 Project Structure
Tech_eazy_devops/
│
├── main.tf                 # EC2 instance and provider configuration
├── variables.tf            # Variables used in Terraform
├── outputs.tf              # Output values (e.g., public IP)
├── user_data.sh            # Script that runs on EC2 startup
├── dev_config.tfvars       # Dev environment config
├── prod_config.tfvars      # Prod environment config
└── README.md               # Documentation


⚙️ Step-by-Step Deployment Guide
1️⃣ Clone the Repository
git clone https://github.com/<your-username>/Tech_eazy_devops.git
cd Tech_eazy_devops


2️⃣ Configure AWS Credentials
Run:
aws configure

Enter:


AWS Access Key ID


AWS Secret Access Key


Default region (e.g. ap-south-1)


Output format: json



3️⃣ Initialize Terraform
terraform init

This downloads the AWS provider and sets up your local environment.

4️⃣ Select Environment
For Dev:
terraform plan -var-file="dev_config.tfvars"
terraform apply -var-file="dev_config.tfvars" -auto-approve

For Prod:
terraform plan -var-file="prod_config.tfvars"
terraform apply -var-file="prod_config.tfvars" -auto-approve


5️⃣ Wait for EC2 Instance to Launch
Terraform will print the Public IP after creation, e.g.:
Outputs:

public_ip = "13.232.xxx.xxx"


6️⃣ Test the Application
Once the instance is up, open your browser and visit:
http://<PUBLIC_IP>:8080

You should see your Spring Boot application running 🎉

7️⃣ (Optional) Connect via SSH
ssh -i "terra-key-ec2.pem" ubuntu@<PUBLIC_IP>

You can check running processes:
ps aux | grep java


8️⃣ Destroy the Infrastructure
To avoid extra AWS charges:
terraform destroy -var-file="dev_config.tfvars" -auto-approve


🧠 Notes


Make sure your security group allows inbound rules for:


Port 22 (SSH)


Port 8080 (HTTP)




The user_data.sh script handles:


System update


Java & Maven installation


App clone + build + run





📜 user_data.sh Breakdown
#!/bin/bash
sudo apt update -y
sudo apt install openjdk-21-jdk -y
sudo apt install maven -y

cd /home/ubuntu
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git
cd test-repo-for-devops

mvn clean package
nohup java -jar target/techeazy-devops-0.0.1-SNAPSHOT.jar > app.log 2>&1 &


👨‍💻 Author
Praveen (Tech Eazy DevOps)
DevOps & Cloud Enthusiast | AWS | Terraform | CI/CD | Automation
🔗 GitHub Profile
🔗 LinkedIn

🏁 End of Deployment Guide

This setup provides a fully automated EC2 deployment pipeline using Terraform — ideal for demonstrating real-world DevOps automation.


---

Would you like me to include a **“multi-environment folder structure”** version (like `/env/dev/` and `/env/prod/`) inside the README for extra professionalism?  
That’s often asked in real DevOps project submissions.
