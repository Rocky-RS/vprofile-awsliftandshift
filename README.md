# AWS Lift and Shift – vProfile Application

This project demonstrates a **real-world Lift and Shift migration** of the **vProfile multi-tier Java application** to AWS.

The migration is performed **without changing application code**, following enterprise-style DevOps practices using EC2, AMIs, Auto Scaling Groups, and an Application Load Balancer.

The project starts with **manual deployment** and gradually evolves toward **automation and high availability**.

---

## 🧱 Application Architecture

**vProfile is a 5-tier application:**

- Nginx – Web server / Reverse proxy
- Apache Tomcat – Application server
- MySQL – Database
- Memcached – Cache
- RabbitMQ – Messaging Queue

---

## ☁️ AWS Services Used

- Amazon EC2
- Amazon AMI
- Auto Scaling Group (ASG)
- Application Load Balancer (ALB)
- Target Groups
- Security Groups
- EBS Volumes
- IAM (basic usage)

---

## 🚀 Project Phases

### Phase 1 – Manual Lift & Shift
- Launched EC2 instances for each component
- Installed and configured services manually
- Deployed vProfile application
- Verified application access via public IP

### Phase 2 – AMI Creation
- Created a custom AMI from the application EC2
- Enabled Tomcat auto-start
- Validated AMI by launching new instances

### Phase 3 – High Availability & Scalability
- Created Launch Template using custom AMI
- Configured Auto Scaling Group
- Integrated Application Load Balancer
- Performed Instance Refresh
- Verified application via ALB DNS

### Phase 4 – Cost Optimization & Cleanup
- Terminated unused EC2 instances
- Deleted unused Load Balancers
- Removed old AMIs and snapshots
- Stopped non-required services

---

## 🧪 Validation

- Application login page accessible via ALB
- Auto Scaling instances are healthy
- Tomcat starts automatically on launch
- Database and backend services reachable

---

## 📜 Automation Scripts

Automation scripts are located in the `scripts/` directory.

| Script Name | Purpose |
|------------|--------|
| `app-bootstrap.sh` | Installs and configures Nginx, Tomcat, and deploys the application |
| `db-setup.sh` | Sets up MySQL database and imports schema |
| `services-check.sh` | Verifies status of all application services |
| `cleanup.sh` | Stops services and cleans unused resources |

> These scripts are designed to reduce manual effort and support AMI-based deployments.

---

## 📸 Screenshots

Screenshots are available in the `screenshots/` directory.

---

## 🧹 Cleanup Strategy

To avoid unnecessary AWS charges:
- Stop or terminate EC2 instances when not in use
- Delete unused Load Balancers
- Remove old AMIs and snapshots
- Monitor EBS volumes

---

## 🧠 Key Learnings

- Real-world Lift and Shift migration
- EC2 → AMI → ASG workflow
- Load Balancer integration
- AWS cost optimization awareness
- Production-style deployment approach

---

## 👨‍💻 Author

**Rahul Guleria**  
DevOps | AWS | Linux | Automation

