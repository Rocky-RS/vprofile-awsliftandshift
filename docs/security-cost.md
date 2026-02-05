# Security and Cost Considerations – AWS Lift & Shift

This document outlines key security and cost decisions taken during the
Lift & Shift migration of the vProfile application to AWS.

---

## 🔐 Security Considerations

### Network Isolation
- All EC2 instances are deployed inside a single VPC
- Backend services (MySQL, Memcached, RabbitMQ) are not publicly accessible
- Communication between tiers happens using private IPs only

### Security Groups
- App EC2 allows inbound traffic only on required ports (80/443)
- Database EC2 allows MySQL access only from App EC2 security group
- Memcached and RabbitMQ accept traffic only from App EC2
- No open access to backend tiers from the internet

### Credentials Management
- Database credentials are currently hardcoded for demo purposes
- In a production environment:
  - AWS Secrets Manager would be used
  - IAM roles would replace static credentials

### Access Control
- SSH access restricted using key-based authentication
- Only required ports are opened per EC2 role

---

## 💰 Cost Considerations

### Lift & Shift Cost Reality
- Lift & Shift prioritizes speed over optimization
- Some services remain on EC2 instead of managed AWS services

### EC2 Usage
- Separate EC2 instances for each tier increase cost
- Chosen to preserve legacy architecture and reduce migration risk

### Scalability and Cost Balance
- Only the application tier is auto-scaled using ASG
- Database tier remains static to avoid complexity and migration risk

### Future Cost Optimizations
- Migrate MySQL to Amazon RDS
- Replace Memcached EC2 with ElastiCache
- Replace RabbitMQ EC2 with Amazon MQ
- Use Auto Scaling and ALB to reduce idle capacity

---

## 🎯 Key Takeaway

This project demonstrates a realistic Lift & Shift approach where:
- Security is handled using network isolation and access control
- Cost optimization is deferred in favor of migration stability
- Cloud-native improvements are planned incrementally

