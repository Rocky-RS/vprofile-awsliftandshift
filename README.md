# AWS Lift and Shift – vProfile Application

This project demonstrates a complete **Lift and Shift migration** of the **vProfile multi-tier Java application** to AWS.

The goal is to migrate an on-premise style architecture to AWS **without changing application code**, using EC2, AMIs, Auto Scaling Groups, and Application Load Balancer.

---

## 🧱 Application Architecture

**vProfile is a 5-tier application:**

- Nginx – Web server / Reverse proxy
- Apache Tomcat – Application server
- MySQL – Database
- Memcached – Cache
- RabbitMQ – Messaging queue

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
- Verified application access

### Phase 2 – AMI Creation
- Created custom AMI from application EC2
- Enabled Tomcat auto-start
- Validated AMI by launching new instance

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
- Auto Scaling instances healthy
- Tomcat running automatically on launch
- Database and backend services reachable

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
- AWS cost awareness
- Production-style deployment flow

---

## 👨‍💻 Author

**Rahul Guleria**  
DevOps | AWS | Linux | Automation
