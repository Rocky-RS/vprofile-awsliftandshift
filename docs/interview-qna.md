# AWS Lift & Shift – Interview Q&A (vProfile Project)

## Q1: Can you explain this project in simple terms?

I migrated a legacy Java-based multi-tier application (vProfile) from a
traditional setup to AWS using a Lift & Shift strategy.  
The goal was to move the application to the cloud without changing application
code, while improving automation and scalability.

---

## Q2: What does Lift & Shift mean in this project?

Lift & Shift means:
- No application code changes
- Same architecture preserved
- Infrastructure moved to AWS

In this project, each tier (App, DB, Cache, Messaging) runs on a separate EC2,
just like in a traditional data center.

---

## Q3: What was the application architecture?

The application had five tiers:
- Web: Nginx
- App: Tomcat
- Database: MySQL
- Cache: Memcached
- Messaging: RabbitMQ

Each tier was deployed on its own EC2 instance inside the same VPC.

---

## Q4: How did you automate the setup?

I created role-based shell scripts:
- App bootstrap script (Java, Tomcat, Nginx)
- DB setup script (MySQL, user, schema)
- Memcached setup script
- RabbitMQ setup script

This ensured the environment could be recreated consistently.

---

## Q5: How did you handle scalability?

Only the application tier was scaled:
- Created an AMI from a working App EC2
- Used the AMI in a Launch Template
- Created an Auto Scaling Group (ASG)

The database tier remained static, which reflects real-world Lift & Shift
constraints.

---

## Q6: How did services communicate securely?

- All services used private IPs inside the VPC
- Security Groups restricted access between tiers
- Backend services were not publicly accessible

---

## Q7: Why didn’t you use RDS or managed services?

Because this was a Lift & Shift migration.
The priority was speed and stability, not optimization.

Managed services were planned as future improvements.

---

## Q8: What would you improve next?

- Add an Application Load Balancer (ALB)
- Move credentials to AWS Secrets Manager
- Migrate MySQL to Amazon RDS
- Replace EC2-based Memcached and RabbitMQ with managed services

---

## Key Strength of This Project

This project reflects how real enterprises migrate legacy applications:
incrementally, safely, and without breaking production.

