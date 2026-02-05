# Application Load Balancer (ALB) – Design & Integration

## Objective
Introduce an Application Load Balancer (ALB) in front of the application tier
to distribute traffic across multiple App EC2 instances running inside an
Auto Scaling Group.

This enhancement improves availability without changing application code.

---

## Why ALB Is Needed

Before ALB:
- Single App EC2 handled all traffic
- No fault tolerance
- Manual recovery required

After ALB:
- Traffic distributed across multiple App EC2s
- Automatic health checks
- Zero-downtime scaling

---

## ALB Placement

- ALB is deployed in the same VPC as the App EC2 instances
- ALB is internet-facing
- App EC2 instances remain private

---

## Traffic Flow


- ALB listens on port 80 (and optionally 443)
- Forwards requests to App EC2 instances
- Health checks ensure only healthy instances receive traffic

---

## Target Group Configuration

- Target type: Instance
- Protocol: HTTP
- Port: 80
- Health check path: `/`

Instances failing health checks are automatically removed from rotation.

---

## Security Considerations

- ALB allows inbound traffic from the internet
- App EC2 Security Group allows traffic only from ALB Security Group
- Backend tiers remain isolated

---

## Lift & Shift Alignment

- No application code changes
- Same application stack preserved
- Infrastructure improved incrementally

This matches real-world enterprise migration practices.

