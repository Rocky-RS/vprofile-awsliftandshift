# 2-Minute Project Explanation – AWS Lift & Shift

I worked on an AWS Lift & Shift migration of a legacy Java application called
vProfile.

The application had multiple tiers including Nginx, Tomcat, MySQL, Memcached,
and RabbitMQ. Instead of refactoring the code, I preserved the existing
architecture and migrated it to AWS using EC2.

Each tier was deployed on a separate EC2 instance, and I automated the setup
using shell scripts to ensure repeatability.

Once the application was stable, I created an AMI from the App EC2 and used it
to build a Launch Template and Auto Scaling Group, enabling horizontal scaling
of the application tier.

The database tier was kept static, which reflects real-world Lift & Shift
constraints.

This project demonstrates my understanding of legacy migrations, automation,
AWS fundamentals, and cloud scalability.

