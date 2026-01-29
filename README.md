# vProfile AWS Lift & Shift

This repository contains the AWS cloud migration (Lift & Shift) project for the vProfile web application.

## Goal
Migrate the existing vProfile application from local/on-prem setup to AWS Cloud using EC2 infrastructure without refactoring the application.

## Architecture (Phase-wise)
Phase 1: Single EC2 Lift & Shift  
Phase 2: Two-tier architecture  
Phase 3: Load Balancer + Auto Scaling Group  
Phase 4: DNS + HTTPS  
Phase 5: Managed AWS Services (RDS, ElastiCache, Amazon MQ)

## Stack
- AWS EC2 (Ubuntu)
- Nginx
- Tomcat
- MySQL
- RabbitMQ
- Memcached
- GitHub Automation
- Bash Scripts

## Flow
Source Repo → Automation Repo → AWS EC2 → Public Access

## Repositories
- Source: vprofile-manual-setup  
- Automation: vprofile-automation  
- Cloud: vprofile-awsliftandshift

## Status
Phase 1: In Progress

