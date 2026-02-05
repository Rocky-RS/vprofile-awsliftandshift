🔁 AWS Lift & Shift — WHAT WE DID 
🎯 Objective 

Migrate the vProfile legacy Java application from a traditional setup to AWS, without changing application code.

That is exactly what Lift & Shift means.

🟢 PHASE 1: Understanding the Application 

We first understood that vProfile is a multi-tier app:

Web: Nginx

App: Tomcat

Database: MySQL

Cache: Memcached

Messaging: RabbitMQ

👉 This is important because Lift & Shift means all these must work together exactly as before.

🟢 PHASE 2: Initial AWS Setup (What you already had)

Before we cleaned things, you had already:

Created separate EC2 instances:

vprofile-db → MySQL

App EC2 → Tomcat + Nginx

Memcached EC2

RabbitMQ EC2

App EC2 was configured to talk to DB EC2

Application was working in AWS

👉 This was a classic multi-EC2 Lift & Shift (very common in real companies).

🟢 PHASE 3: App Tier Automation (What we did together)

Together, we focused on automation and reproducibility.

We:

Wrote shell scripts for:

App bootstrap

DB setup

Service checks

Cleanup

Tested everything locally on Ubuntu

Verified:

All services start correctly

App opens in browser

Login works

👉 This step is huge — many people skip this and fail later.

🟢 PHASE 4: Moving Toward Scalability (ASG + AMI)

Then we moved to cloud-native scaling, which is where Lift & Shift becomes real.

We did:

Created an AMI from the working App EC2

Created a Launch Template using that AMI

Created an Auto Scaling Group (ASG)

Planned to put ALB in front of ASG

👉 Goal: scale the application tier, not the database (very realistic).


## 📄 Documentation

- Architecture details: `docs/architecture.md`
- Role-based bootstrap scripts: `scripts/`

