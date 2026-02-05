# vProfile – AWS Lift & Shift Architecture

## Overview
This project represents a real-world Lift & Shift migration of a legacy Java-based
vProfile application to AWS without modifying application code.

The migration preserves the original multi-tier architecture.

---

## Application Components

| Tier | Technology | AWS Resource |
|----|----|----|
| Web | Nginx | EC2 |
| App | Tomcat | EC2 |
| Database | MySQL | EC2 |
| Cache | Memcached | EC2 |
| Messaging | RabbitMQ | EC2 |

---

## Deployment Model

Each tier runs on a **separate EC2 instance**:

- App EC2: Nginx + Tomcat
- DB EC2: MySQL
- Cache EC2: Memcached
- MQ EC2: RabbitMQ

This reflects a **classic enterprise Lift & Shift approach**.

---

## Networking

- All EC2 instances are deployed in the same VPC
- Services communicate using **private IPs**
- Security Groups restrict access by port and source

---

## Scalability Strategy

- Application tier is designed to scale using:
  - AMI
  - Launch Template
  - Auto Scaling Group (ASG)
- Database tier remains static (typical Lift & Shift constraint)

---

## Future Enhancements

- Application Load Balancer (ALB)
- Externalized configuration
- Secrets Manager for credentials

