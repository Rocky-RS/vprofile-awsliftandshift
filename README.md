# 🔁 AWS Lift & Shift Project – vProfile Application

## 📌 Overview
This project demonstrates a **real-world AWS Lift & Shift migration** of a
legacy Java-based **vProfile application** from a traditional environment to AWS.

The migration preserves the existing application architecture and avoids
application code changes, focusing instead on **automation, scalability,
and cloud readiness**.

---

## 🎯 Objective
- Migrate a legacy multi-tier application to AWS
- Preserve existing architecture (Lift & Shift)
- Improve reliability and scalability
- Automate infrastructure provisioning

---

## 🏗 Application Architecture

The vProfile application consists of the following tiers:

| Tier | Technology | Deployment |
|----|----|----|
| Web | Nginx | EC2 |
| App | Tomcat | EC2 |
| Database | MySQL | EC2 |
| Cache | Memcached | EC2 |
| Messaging | RabbitMQ | EC2 |

Each tier runs on a **separate EC2 instance**, reflecting a traditional
enterprise architecture.

---

## 🚀 Migration Phases

### 🟢 Phase 1: Application Understanding
- Analyzed the multi-tier architecture
- Identified service dependencies
- Planned Lift & Shift strategy without code changes

### 🟢 Phase 2: Initial AWS Setup
- Deployed each tier on a separate EC2 instance
- Verified inter-service communication
- Validated application functionality on AWS

### 🟢 Phase 3: Automation
- Created role-based shell scripts for:
  - App bootstrap
  - Database setup
  - Memcached setup
  - RabbitMQ setup
- Ensured reproducible and consistent deployments

### 🟢 Phase 4: Scalability
- Created an AMI from a working App EC2
- Built a Launch Template
- Created an Auto Scaling Group (ASG)
- Planned Application Load Balancer (ALB) integration

---

## ⚙️ Automation Scripts

Scripts are organized by EC2 role:

```text
scripts/
├── app/
├── db/
├── memcached/
├── rabbitmq/
└── common/

Each script is executed only on its respective EC2 instance.




📄 Documentation

Architecture overview & diagram: docs/architecture-diagram.md

AMI & Auto Scaling design: docs/ami-asg.md

Application Load Balancer design: docs/alb.md

Security & cost considerations: docs/security-cost.md

Interview Q&A: docs/interview-qna.md

2-minute project pitch: docs/project-pitch.md



🔐 Security & Cost Highlights

Backend services are private and VPC-isolated

Security Groups restrict inter-tier access

Lift & Shift prioritizes stability over optimization

Future migration path to managed AWS services documented



🧠 Key Learnings

Real-world Lift & Shift migrations are incremental

Automation is critical before scaling

Not all tiers should be scaled immediately

Cloud modernization does not always mean refactoring




🏁 Conclusion

This project mirrors how enterprises migrate legacy applications to AWS:
safely, incrementally, and without breaking production systems.

It demonstrates hands-on experience with AWS infrastructure,
automation, and cloud-native scaling principles.
