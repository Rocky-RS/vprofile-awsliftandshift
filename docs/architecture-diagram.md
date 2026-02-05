# AWS Lift & Shift – Architecture Diagram

## High-Level Architecture

                 ┌────────────────────┐
                 │      Internet       │
                 └─────────┬──────────┘
                           │
                 ┌─────────▼──────────┐
                 │   (Future) ALB      │
                 └─────────┬──────────┘
                           │
            ┌──────────────┴──────────────┐
            │        Auto Scaling Group     │
            │        (App Tier)             │
            │                               │
    ┌────────▼────────┐         ┌─────────▼────────┐
    │   App EC2 #1     │         │   App EC2 #2      │
    │ Nginx + Tomcat   │         │ Nginx + Tomcat    │
    └────────┬────────┘         └─────────┬────────┘
             │                              │
    ─────────┼──────────── Private VPC ─────┼─────────
             │                              │
 ┌───────────▼──────────┐     ┌────────────▼──────────┐
 │     MySQL EC2         │     │    Memcached EC2      │
 │   (Database Tier)     │     │     (Cache Tier)      │
 └──────────────────────┘     └───────────────────────┘
                │
      ┌─────────▼─────────┐
      │   RabbitMQ EC2     │
      │ (Messaging Tier)  │
      └───────────────────┘

---

## Architecture Explanation

### Application Tier
- Runs on EC2 instances inside an Auto Scaling Group
- Uses Nginx as web server and Tomcat as application server
- Scales horizontally using AMI + ASG

### Database Tier
- MySQL runs on a dedicated EC2 instance
- Remains static as part of Lift & Shift strategy
- Accessed via private IP inside the VPC

### Cache Tier
- Memcached deployed on a separate EC2
- Improves application performance
- Communicates over private network

### Messaging Tier
- RabbitMQ deployed on its own EC2
- Handles asynchronous messaging
- Used without modifying application code

### Networking
- All EC2 instances are deployed inside the same VPC
- Communication happens using private IPs
- Security Groups control access between tiers

---

## Why This Architecture Matters

- Preserves legacy application design
- Enables cloud scalability without refactoring
- Mirrors real enterprise Lift & Shift migrations

