# Phase 4 – Application Tier Scalability (AMI + ASG)

## Objective
Move from manually managed EC2 instances to a scalable, cloud-native
application tier using AWS Auto Scaling — without changing application code.

This aligns with the Lift & Shift strategy.

---

## Why AMI Was Required

After validating that the application works correctly on a single App EC2,
an Amazon Machine Image (AMI) was created to:

- Capture OS configuration
- Capture installed packages (Java, Tomcat, Nginx)
- Preserve application deployment
- Enable repeatable launches

---

## AMI Creation Process

1. App EC2 was fully configured and tested
2. AMI was created from the running instance
3. AMI became the immutable base for scaling

This ensures consistency across all future App instances.

---

## Launch Template

A Launch Template was created using the AMI to define:

- Instance type
- AMI ID
- Security Groups
- User Data (optional for future updates)

This decouples instance configuration from scaling logic.

---

## Auto Scaling Group (ASG)

An Auto Scaling Group was created to:

- Maintain desired number of App instances
- Automatically replace unhealthy instances
- Enable horizontal scaling

### Key Design Decision
- Application tier is scalable
- Database tier remains static

This reflects real-world enterprise Lift & Shift constraints.

---

## Load Balancer (Planned)

An Application Load Balancer (ALB) is planned in front of the ASG to:

- Distribute traffic across App instances
- Perform health checks
- Enable zero-downtime scaling

---

## Benefits Achieved

- High availability
- Fault tolerance
- Repeatable infrastructure
- Cloud-native scaling with legacy application

