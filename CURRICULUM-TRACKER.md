# AWS + Terraform Curriculum Tracker

> Hands-on AWS learning using AWS CLI, PowerShell, Terraform, and Floci as the local AWS-compatible environment.

---

## How to Use

### Completion Markers

- [ ] Not started
- [~] Studying
- [x] Completed
- [F] Tested with Floci
- [T] Tested with Terraform
- [P] Used in project

### Rules

A topic is considered **fully completed** when:

```
[x] Concept
[x] CLI
[x] Terraform
[x] Exercise
[x] Troubleshooting
[x] Evidence
```

Never mark an AWS feature as tested merely because you studied its documentation.

---

## Last Studied

- **Module:** 02 — AWS CLI
- **Topic:** CLI Fundamentals
- **Date:** 2026-09-21

---

## Progress Summary

| #   | Module                          | Status | Last Updated |
| --- | ------------------------------- | ------ | ------------ |
| 01  | AWS Fundamentals                | [x]    | 2026-09-21   |
| 02  | AWS CLI                         | [x]    | 2026-09-21   |
| 03  | Terraform Basics                | [ ]    |              |
| 04  | IAM                             | [ ]    |              |
| 05  | S3                              | [ ]    |              |
| 06  | DynamoDB                        | [ ]    |              |
| 07  | EC2                             | [ ]    |              |
| 08  | VPC                             | [ ]    |              |
| 09  | RDS                             | [ ]    |              |
| 10  | SQS                             | [ ]    |              |
| 11  | SNS                             | [ ]    |              |
| 12  | Lambda                          | [ ]    |              |
| 13  | API Gateway                     | [ ]    |              |
| 14  | CloudWatch                      | [ ]    |              |
| 15  | CloudTrail                      | [ ]    |              |
| 16  | Storage + CDN                   | [ ]    |              |
| 17  | Terraform State                 | [ ]    |              |
| 18  | Terraform Modules               | [ ]    |              |
| 19  | Terraform Environments          | [ ]    |              |
| 20  | AWS Security                    | [ ]    |              |
| 21  | High Availability               | [ ]    |              |
| 22  | Scaling                         | [ ]    |              |
| 23  | AWS Architecture                | [ ]    |              |
| P1  | Project 01 — S3 Storage         | [ ]    |              |
| P2  | Project 02 — DynamoDB           | [ ]    |              |
| P3  | Project 03 — Messaging          | [ ]    |              |
| P4  | Project 04 — Serverless API     | [ ]    |              |
| P5  | Project 05 — Monitoring         | [ ]    |              |
| P6  | Project 06 — Final AWS Platform | [ ]    |              |

---

# Phase 1 — Foundations

## 01 — AWS Fundamentals

### Concepts

- [x] What is cloud computing?
- [x] IaaS
- [x] PaaS
- [x] SaaS
- [x] Public/private/hybrid cloud
- [x] AWS global infrastructure
- [x] Regions
- [x] Availability Zones
- [x] Edge locations
- [x] AWS services
- [x] Managed vs unmanaged services
- [x] Shared responsibility model
- [x] AWS resources
- [x] Resource identifiers
- [x] ARNs
- [x] AWS pricing basics
- [x] Pay-as-you-go model
- [x] Free tier concept
- [x] Service quotas
- [x] AWS documentation navigation

### Exercises

- [x] Identify region/AZ concepts
- [x] Identify resource relationships
- [x] Find ARNs in AWS documentation
- [x] Map common backend requirements to AWS services

---

## 02 — AWS CLI

### CLI Fundamentals

- [x] Install AWS CLI
- [x] `aws --version`
- [x] AWS CLI structure
- [x] Commands
- [x] Subcommands
- [x] Options
- [x] Output formats
- [x] JSON output
- [x] Table output
- [x] Text output
- [x] `--query`
- [x] `--filter`
- [x] Environment variables
- [x] Profiles
- [x] Region configuration
- [x] Credentials concept
- [x] AWS CLI help
- [x] Reading AWS CLI documentation

### PowerShell

- [x] Variables
- [x] Environment variables
- [x] Pipelines
- [x] Objects
- [x] JSON conversion
- [x] `ForEach-Object`
- [x] `Where-Object`
- [x] Scripts
- [x] Error handling
- [x] Exit codes

### Exercises

- [x] Create reusable AWS PowerShell scripts
- [x] Capture command output
- [x] Parse AWS JSON output
- [x] Automate repetitive AWS CLI tasks
- [x] Create cleanup scripts

---

## 03 — Terraform Basics

### Terraform Fundamentals

- [ ] Infrastructure as Code
- [ ] Declarative vs imperative
- [ ] Terraform workflow
- [ ] Providers
- [ ] Resources
- [ ] Data sources
- [ ] Variables
- [ ] Outputs
- [ ] Locals
- [ ] Expressions
- [ ] Dependencies
- [ ] Resource references
- [ ] Terraform configuration structure

### Commands

- [ ] `terraform init`
- [ ] `terraform fmt`
- [ ] `terraform validate`
- [ ] `terraform plan`
- [ ] `terraform apply`
- [ ] `terraform destroy`
- [ ] `terraform show`
- [ ] `terraform output`

### HCL

- [ ] Blocks
- [ ] Arguments
- [ ] Strings
- [ ] Numbers
- [ ] Booleans
- [ ] Lists
- [ ] Maps
- [ ] Objects
- [ ] Conditionals
- [ ] `for` expressions
- [ ] Functions
- [ ] Variable types
- [ ] Defaults
- [ ] Sensitive variables

### Exercises

- [ ] Create first Terraform resource
- [ ] Use variables
- [ ] Use outputs
- [ ] Use locals
- [ ] Reference resources
- [ ] Destroy and recreate resources
- [ ] Compare Terraform with AWS CLI

---

# Phase 2 — Core AWS Services

## 04 — IAM

### Concepts

- [ ] IAM users
- [ ] IAM groups
- [ ] IAM roles
- [ ] IAM policies
- [ ] Managed policies
- [ ] Inline policies
- [ ] Policy documents
- [ ] Actions
- [ ] Resources
- [ ] Effects
- [ ] Conditions
- [ ] ARN
- [ ] Authentication
- [ ] Authorization
- [ ] Least privilege
- [ ] Role assumption

### CLI

- [ ] Create/list users
- [ ] Policies
- [ ] Roles
- [ ] Attach policies
- [ ] Inspect permissions
- [ ] Delete IAM resources

### Terraform

- [ ] IAM user
- [ ] IAM policy
- [ ] IAM role
- [ ] Policy attachment
- [ ] Assume-role policy

### Exercises

- [ ] Create read-only policy
- [ ] Create write policy
- [ ] Create least-privilege policy
- [ ] Intentionally create AccessDenied
- [ ] Troubleshoot permissions

---

## 05 — S3

### Concepts

- [ ] Object storage
- [ ] Buckets
- [ ] Objects
- [ ] Keys
- [ ] Regions
- [ ] Storage classes
- [ ] Versioning
- [ ] Lifecycle
- [ ] Metadata
- [ ] Encryption
- [ ] Bucket policies
- [ ] Access control

### CLI

- [ ] Create bucket
- [ ] List buckets
- [ ] Upload object
- [ ] Download object
- [ ] Copy object
- [ ] Delete object
- [ ] Delete bucket
- [ ] Enable versioning
- [ ] Inspect objects
- [ ] Configure lifecycle

### Terraform

- [ ] S3 bucket
- [ ] Versioning
- [ ] Lifecycle rules
- [ ] Encryption
- [ ] Bucket policy
- [ ] Outputs

### Exercises

- [ ] Basic storage
- [ ] Versioned bucket
- [ ] Lifecycle bucket
- [ ] Permission scenarios
- [ ] Cleanup automation

### Project

- [ ] S3 storage/backup project

---

## 06 — DynamoDB

### Concepts

- [ ] NoSQL
- [ ] Tables
- [ ] Items
- [ ] Attributes
- [ ] Partition key
- [ ] Sort key
- [ ] Composite primary key
- [ ] Query
- [ ] Scan
- [ ] GSIs
- [ ] LSIs
- [ ] Capacity
- [ ] Consistency
- [ ] TTL

### CLI

- [ ] Create table
- [ ] Describe table
- [ ] Put item
- [ ] Get item
- [ ] Update item
- [ ] Delete item
- [ ] Query
- [ ] Scan

### Terraform

- [ ] DynamoDB table
- [ ] Keys
- [ ] Attributes
- [ ] Indexes
- [ ] TTL
- [ ] Billing configuration

### Exercises

- [ ] Basic CRUD
- [ ] Design partition key
- [ ] Add sort key
- [ ] Create GSI
- [ ] Compare Query vs Scan
- [ ] Test invalid key access

### Project

- [ ] DynamoDB application project

---

## 07 — EC2

### Concepts

- [ ] Virtual machines
- [ ] AMI
- [ ] Instance types
- [ ] Instance lifecycle
- [ ] Public/private IP
- [ ] Elastic IP
- [ ] User data
- [ ] SSH
- [ ] Security groups
- [ ] EBS
- [ ] Instance metadata

### CLI

- [ ] List instances
- [ ] Launch instance
- [ ] Stop instance
- [ ] Start instance
- [ ] Reboot
- [ ] Terminate
- [ ] Describe instances

### Terraform

- [ ] EC2 resource
- [ ] AMI
- [ ] Instance type
- [ ] User data
- [ ] Security groups
- [ ] EBS

### Exercises

- [ ] Launch instance
- [ ] Stop/start lifecycle
- [ ] Attach storage
- [ ] Security group rules
- [ ] Troubleshoot connectivity

---

## 08 — VPC

### Networking Fundamentals

- [ ] IP addresses
- [ ] CIDR
- [ ] Public/private networks
- [ ] Subnets
- [ ] Route tables
- [ ] Internet gateway
- [ ] NAT gateway
- [ ] Security groups
- [ ] Network ACLs
- [ ] DNS
- [ ] Availability Zones

### CLI

- [ ] Create VPC
- [ ] Create subnet
- [ ] Create route table
- [ ] Create routes
- [ ] Create internet gateway
- [ ] Associate resources
- [ ] Inspect networking

### Terraform

- [ ] VPC
- [ ] Subnets
- [ ] Route tables
- [ ] Routes
- [ ] Internet gateway
- [ ] Security groups

### Exercises

- [ ] Public subnet
- [ ] Private subnet
- [ ] Routing
- [ ] Security group rules
- [ ] Troubleshoot network connectivity

---

## 09 — RDS

### Concepts

- [ ] Managed relational database
- [ ] PostgreSQL
- [ ] DB instance
- [ ] DB engine
- [ ] Storage
- [ ] Backups
- [ ] Snapshots
- [ ] Multi-AZ
- [ ] Security
- [ ] Parameter groups
- [ ] Connection configuration

### Terraform

- [ ] RDS instance
- [ ] PostgreSQL
- [ ] Storage
- [ ] Credentials
- [ ] Security groups
- [ ] Backup configuration

### Exercises

- [ ] Provision database
- [ ] Configure PostgreSQL
- [ ] Test connection
- [ ] Backup
- [ ] Restore
- [ ] Security configuration

---

# Phase 3 — Messaging & Serverless

## 10 — SQS

### Concepts

- [ ] Queue concepts
- [ ] Standard queue
- [ ] FIFO queue
- [ ] Message
- [ ] Producer
- [ ] Consumer
- [ ] Visibility timeout
- [ ] Message retention
- [ ] Long polling
- [ ] Dead-letter queues
- [ ] Redrive policy

### CLI

- [ ] Create queue
- [ ] Send message
- [ ] Receive message
- [ ] Delete message
- [ ] Purge queue
- [ ] Configure queue

### Terraform

- [ ] Queue
- [ ] FIFO configuration
- [ ] Visibility timeout
- [ ] DLQ
- [ ] Redrive policy

### Exercises

- [ ] Producer/consumer
- [ ] Visibility timeout
- [ ] Retry scenario
- [ ] DLQ scenario

---

## 11 — SNS

### Concepts

- [ ] Topics
- [ ] Publishers
- [ ] Subscribers
- [ ] Subscriptions
- [ ] Fan-out
- [ ] Message filtering
- [ ] SNS -> SQS

### Exercises

- [ ] Create topic
- [ ] Publish message
- [ ] Subscribe queue
- [ ] Build fan-out architecture
- [ ] Test failed consumer scenario

### Terraform

- [ ] SNS topic
- [ ] Subscription
- [ ] SNS -> SQS
- [ ] Policies

---

## 12 — Lambda

### Concepts

- [ ] Serverless computing
- [ ] Function
- [ ] Runtime
- [ ] Handler
- [ ] Event
- [ ] Trigger
- [ ] Execution role
- [ ] Environment variables
- [ ] Timeout
- [ ] Memory
- [ ] Cold starts
- [ ] Concurrency
- [ ] Layers

### CLI

- [ ] Create function
- [ ] Invoke function
- [ ] Update function
- [ ] View logs
- [ ] Delete function

### Terraform

- [ ] Lambda function
- [ ] IAM role
- [ ] Permissions
- [ ] Environment variables
- [ ] Triggers

### Exercises

- [ ] Basic Lambda
- [ ] Lambda + DynamoDB
- [ ] Lambda + SQS
- [ ] Error handling
- [ ] Retry behaviour

---

## 13 — API Gateway

### Concepts

- [ ] API concepts
- [ ] Routes
- [ ] Methods
- [ ] Integrations
- [ ] Lambda integration
- [ ] Stages
- [ ] Deployment
- [ ] Request/response
- [ ] API authorization
- [ ] CORS

### Exercises

- [ ] Create API
- [ ] Create route
- [ ] Connect Lambda
- [ ] Test API
- [ ] Handle errors
- [ ] Configure CORS

### Project

```
API Gateway
      |
   Lambda
      |
 DynamoDB
```

---

# Phase 4 — Observability & Audit

## 14 — CloudWatch

### Concepts

- [ ] Logs
- [ ] Log groups
- [ ] Log streams
- [ ] Metrics
- [ ] Custom metrics
- [ ] Alarms
- [ ] Dashboards
- [ ] Monitoring
- [ ] Log retention
- [ ] Metric dimensions

### CLI

- [ ] Create log group
- [ ] Put logs
- [ ] Query logs
- [ ] Inspect metrics
- [ ] Create alarm

### Terraform

- [ ] Log group
- [ ] Metric alarm
- [ ] Dashboard
- [ ] Retention

### Exercises

- [ ] Monitor application
- [ ] Create error alarm
- [ ] Create latency alarm
- [ ] Build dashboard

---

## 15 — CloudTrail

### Concepts

- [ ] AWS API auditing
- [ ] Events
- [ ] Event history
- [ ] Trails
- [ ] Management events
- [ ] Data events
- [ ] Audit logs

### Exercises

- [ ] Generate AWS activity
- [ ] Find activity in CloudTrail
- [ ] Identify API calls
- [ ] Configure trail
- [ ] Store audit logs

---

# Phase 5 — Storage & Delivery

## 16 — Storage + CDN

### EBS

- [ ] Block storage
- [ ] Volumes
- [ ] Snapshots
- [ ] Volume types
- [ ] Attach/detach
- [ ] Persistence

### EFS

- [ ] Shared file storage
- [ ] Mount targets
- [ ] Network access
- [ ] Use cases

### CloudFront

- [ ] CDN
- [ ] Distribution
- [ ] Origin
- [ ] Cache
- [ ] TTL
- [ ] Cache invalidation
- [ ] HTTPS
- [ ] CloudFront + S3

### Exercises

- [ ] EBS storage
- [ ] EBS snapshot
- [ ] Shared filesystem concepts
- [ ] S3 + CloudFront architecture

---

# Phase 6 — Terraform Deep Dive

## 17 — Terraform State

### Concepts

- [ ] What is state?
- [ ] `terraform.tfstate`
- [ ] State resources
- [ ] State locking
- [ ] Plan
- [ ] Apply
- [ ] Destroy
- [ ] State inspection
- [ ] Import
- [ ] Drift
- [ ] State recovery

### Commands

- [ ] `terraform state list`
- [ ] `terraform state show`
- [ ] `terraform state mv`
- [ ] `terraform state rm`
- [ ] `terraform import`
- [ ] `terraform refresh` / modern equivalent workflows
- [ ] Plan inspection

### Exercises

- [ ] Create state
- [ ] Inspect state
- [ ] Cause drift
- [ ] Detect drift
- [ ] Import resource
- [ ] Recover from state mistakes

---

## 18 — Terraform Modules

### Concepts

- [ ] Module concept
- [ ] Root module
- [ ] Child module
- [ ] Module inputs
- [ ] Module outputs
- [ ] Reusable modules
- [ ] Module composition
- [ ] Module versioning

### Exercises

- [ ] Create S3 module
- [ ] Create DynamoDB module
- [ ] Create networking module
- [ ] Compose multiple modules
- [ ] Build reusable infrastructure

---

## 19 — Terraform Environments

### Concepts

- [ ] Development environment
- [ ] Staging environment
- [ ] Production environment
- [ ] `.tfvars`
- [ ] Variable overrides
- [ ] Environment-specific configuration
- [ ] Workspace concepts
- [ ] Environment isolation

### Exercises

- [ ] Create dev environment
- [ ] Create staging configuration
- [ ] Create production configuration
- [ ] Reuse modules between environments
- [ ] Prevent accidental production changes

---

# Phase 7 — Security

## 20 — AWS Security

### Concepts

- [ ] IAM fundamentals review
- [ ] Least privilege
- [ ] IAM policies
- [ ] Resource policies
- [ ] Encryption at rest
- [ ] Encryption in transit
- [ ] KMS concepts
- [ ] Secrets management
- [ ] Environment variables
- [ ] Security groups
- [ ] Network security
- [ ] Public vs private resources
- [ ] Credential management
- [ ] Avoid hardcoded secrets
- [ ] Secret rotation concepts

### Exercises

- [ ] Restrict S3 access
- [ ] Restrict DynamoDB access
- [ ] Secure EC2
- [ ] Secure RDS
- [ ] Encrypt data
- [ ] Create least-privilege role
- [ ] Find and fix insecure configuration

---

# Phase 8 — Reliability & Scaling

## 21 — High Availability

### Concepts

- [ ] Availability Zones
- [ ] Multi-AZ
- [ ] Redundancy
- [ ] Fault tolerance
- [ ] Backups
- [ ] Snapshots
- [ ] Recovery
- [ ] Failover
- [ ] Disaster recovery
- [ ] RTO
- [ ] RPO
- [ ] Reliability patterns

### Exercises

- [ ] Design multi-AZ system
- [ ] Backup database
- [ ] Restore database
- [ ] Design failure scenarios
- [ ] Document recovery strategy

---

## 22 — Scaling

### Load Balancing

- [ ] Load balancer concepts
- [ ] Target groups
- [ ] Health checks
- [ ] Traffic distribution
- [ ] Application Load Balancer concepts

### Auto Scaling

- [ ] Scaling
- [ ] Horizontal scaling
- [ ] Vertical scaling
- [ ] Desired capacity
- [ ] Minimum capacity
- [ ] Maximum capacity
- [ ] Scaling policies
- [ ] Health checks

### ECS

- [ ] Containers on AWS
- [ ] ECS concepts
- [ ] Cluster
- [ ] Service
- [ ] Task
- [ ] Task definition
- [ ] Container
- [ ] Networking

### ECR

- [ ] Container registry
- [ ] Repository
- [ ] Image
- [ ] Image tags
- [ ] Push/pull

### Exercises

- [ ] Containerize application
- [ ] Push image
- [ ] Deploy container
- [ ] Load balance application
- [ ] Understand scaling architecture

---

# Phase 9 — AWS Architecture

## 23 — AWS Architecture

### Well-Architected

- [ ] Operational excellence
- [ ] Security
- [ ] Reliability
- [ ] Performance efficiency
- [ ] Cost optimization
- [ ] Sustainability

### Architecture Skills

- [ ] Stateless applications
- [ ] Horizontal scaling
- [ ] Caching
- [ ] Queues
- [ ] Asynchronous processing
- [ ] Database selection
- [ ] Storage selection
- [ ] Network design
- [ ] Security boundaries
- [ ] Monitoring
- [ ] Failure handling
- [ ] Disaster recovery

### Architecture Exercises

- [ ] Design simple web application
- [ ] Design scalable API
- [ ] Design asynchronous backend
- [ ] Design serverless API
- [ ] Design high-availability application
- [ ] Design secure application
- [ ] Identify bottlenecks
- [ ] Identify single points of failure
- [ ] Estimate infrastructure requirements

### Diagrams

- [ ] Basic AWS architecture
- [ ] S3 architecture
- [ ] VPC architecture
- [ ] Serverless architecture
- [ ] Messaging architecture
- [ ] HA architecture
- [ ] Final project architecture

---

# Phase 10 — Projects

Projects are where the individual topics become actual engineering experience.

---

## Project 01 — S3 Storage Project

**Goal:** Build a small storage/backup system.

### Requirements

- [ ] S3 bucket
- [ ] Upload files
- [ ] Download files
- [ ] Versioning
- [ ] Lifecycle
- [ ] Permissions
- [ ] Terraform deployment
- [ ] PowerShell CLI automation
- [ ] Cleanup script
- [ ] Documentation

### Evidence

- [ ] CLI commands
- [ ] Terraform files
- [ ] Terraform plan
- [ ] Terraform apply
- [ ] Architecture diagram
- [ ] README

---

## Project 02 — DynamoDB Project

**Goal:** Build a small application data store.

### Requirements

- [ ] DynamoDB table
- [ ] Primary key
- [ ] Sort key
- [ ] CRUD
- [ ] Query
- [ ] Index
- [ ] Terraform
- [ ] AWS CLI
- [ ] Error scenarios

### Evidence

- [ ] CLI scripts
- [ ] Terraform
- [ ] Example requests
- [ ] Architecture diagram
- [ ] README

---

## Project 03 — Message Queue Project

**Architecture:**

```
Producer
   |
 SNS
   |
 SQS
   |
Consumer
```

### Requirements

- [ ] SNS topic
- [ ] SQS queue
- [ ] Subscription
- [ ] Message publishing
- [ ] Message consumption
- [ ] Visibility timeout
- [ ] DLQ
- [ ] Retry behaviour
- [ ] Terraform
- [ ] CLI automation

### Failure Testing

- [ ] Consumer failure
- [ ] Message retry
- [ ] Visibility timeout
- [ ] DLQ routing

---

## Project 04 — Serverless API

**Architecture:**

```
Client
  |
API Gateway
  |
Lambda
  |
DynamoDB
```

### Requirements

- [ ] API Gateway
- [ ] Routes
- [ ] Lambda
- [ ] IAM role
- [ ] DynamoDB
- [ ] CRUD API
- [ ] Environment variables
- [ ] Logging
- [ ] Terraform
- [ ] CLI testing

### API

```
GET    /items
GET    /items/{id}
POST   /items
PUT    /items/{id}
DELETE /items/{id}
```

### Evidence

- [ ] API examples
- [ ] Terraform
- [ ] CLI
- [ ] Logs
- [ ] Architecture diagram
- [ ] README

---

## Project 05 — Monitoring Project

**Goal:** Build an observability setup.

### Requirements

- [ ] CloudWatch logs
- [ ] Metrics
- [ ] Alarms
- [ ] Dashboard
- [ ] Error monitoring
- [ ] Terraform
- [ ] CLI

### Scenarios

- [ ] Application error
- [ ] High request count
- [ ] High latency
- [ ] Resource issue
- [ ] Alarm triggered

---

## Project 06 — Final AWS Platform

This is the final project combining the curriculum.

**Target Architecture:**

```
                    +---------------+
                    |    Client     |
                    +-------+-------+
                            |
                            v
                    +---------------+
                    | API Gateway   |
                    +-------+-------+
                            |
                            v
                    +---------------+
                    |    Compute    |
                    | Lambda / ECS  |
                    +-------+-------+
                            |
             +--------------+--------------+
             v              v              v
        +---------+    +---------+    +---------+
        | DynamoDB|    |   S3    |    |  SQS    |
        +---------+    +---------+    +----+----+
                                            |
                                            v
                                       +---------+
                                       | Worker  |
                                       +---------+

         +-----------------------------------+
         |           CloudWatch              |
         |    Logs / Metrics / Alarms        |
         +-----------------------------------+

         +-----------------------------------+
         |              IAM                  |
         |   Roles / Policies / Access       |
         +-----------------------------------+

         +-----------------------------------+
         |          Terraform                |
         |    Infrastructure as Code         |
         +-----------------------------------+
```

### Infrastructure

- [ ] VPC/networking
- [ ] Subnets
- [ ] Security groups
- [ ] IAM
- [ ] Storage
- [ ] Database
- [ ] Messaging
- [ ] Compute
- [ ] Monitoring

### Terraform

- [ ] Root module
- [ ] Child modules
- [ ] Variables
- [ ] Outputs
- [ ] Locals
- [ ] State
- [ ] Environment configuration
- [ ] Reusable infrastructure
- [ ] `plan`
- [ ] `apply`
- [ ] `destroy`

### AWS CLI / PowerShell

- [ ] Deployment verification
- [ ] Resource inspection
- [ ] Logs
- [ ] Health checks
- [ ] Cleanup
- [ ] Troubleshooting scripts

### Security

- [ ] Least privilege
- [ ] No hardcoded credentials
- [ ] IAM roles
- [ ] Encryption
- [ ] Private resources where appropriate
- [ ] Security groups

### Reliability

- [ ] Failure scenarios
- [ ] Retry handling
- [ ] Backup strategy
- [ ] Recovery strategy
- [ ] Monitoring
- [ ] Alerts

### Documentation

- [ ] Architecture diagram
- [ ] Infrastructure diagram
- [ ] README
- [ ] Setup instructions
- [ ] Terraform instructions
- [ ] CLI instructions
- [ ] Troubleshooting guide
- [ ] Failure scenarios
- [ ] Lessons learned

---

# Global Skills Checklist

These skills should be revisited throughout the repository.

## AWS

- [ ] IAM
- [ ] S3
- [ ] DynamoDB
- [ ] EC2
- [ ] VPC
- [ ] RDS
- [ ] SQS
- [ ] SNS
- [ ] Lambda
- [ ] API Gateway
- [ ] CloudWatch
- [ ] CloudTrail
- [ ] EBS
- [ ] EFS
- [ ] CloudFront
- [ ] ECS
- [ ] ECR

## Infrastructure as Code

- [ ] Terraform fundamentals
- [ ] HCL
- [ ] Providers
- [ ] Resources
- [ ] Variables
- [ ] Outputs
- [ ] Locals
- [ ] Data sources
- [ ] Dependencies
- [ ] State
- [ ] Drift
- [ ] Import
- [ ] Modules
- [ ] Environments
- [ ] Reusable infrastructure

## Networking

- [ ] IP addressing
- [ ] CIDR
- [ ] Subnets
- [ ] Routing
- [ ] Internet gateway
- [ ] NAT
- [ ] Security groups
- [ ] NACL
- [ ] DNS
- [ ] Load balancing

## Security

- [ ] Authentication
- [ ] Authorization
- [ ] IAM
- [ ] Least privilege
- [ ] Encryption
- [ ] Secrets
- [ ] Network security
- [ ] Auditing

## Reliability

- [ ] Multi-AZ
- [ ] Backups
- [ ] Snapshots
- [ ] Failover
- [ ] Recovery
- [ ] RTO
- [ ] RPO
- [ ] Fault tolerance

## Scalability

- [ ] Horizontal scaling
- [ ] Vertical scaling
- [ ] Load balancing
- [ ] Auto scaling
- [ ] Queues
- [ ] Asynchronous processing
- [ ] Stateless architecture
- [ ] Caching concepts

## Observability

- [ ] Logs
- [ ] Metrics
- [ ] Alarms
- [ ] Dashboards
- [ ] Auditing
- [ ] Troubleshooting

---

# CLI + Terraform Mastery Checklist

For every major AWS service, complete this pattern:

| Skill                        | Complete |
| ---------------------------- | -------- |
| Understand service           | [ ]      |
| Create using CLI             | [ ]      |
| Inspect using CLI            | [ ]      |
| Update using CLI             | [ ]      |
| Delete using CLI             | [ ]      |
| Automate using PowerShell    | [ ]      |
| Create using Terraform       | [ ]      |
| Modify using Terraform       | [ ]      |
| Destroy using Terraform      | [ ]      |
| Understand Terraform state   | [ ]      |
| Compare CLI vs Terraform     | [ ]      |
| Intentionally create failure | [ ]      |
| Troubleshoot failure         | [ ]      |
| Use in project               | [ ]      |

---

# Floci Compatibility Tracking

For each topic, record:

| Feature    | Floci | Terraform | Real AWS |
| ---------- | ----- | --------- | -------- |
| Supported  | [ ]   | [ ]       | [ ]      |
| Tested     | [ ]   | [ ]       | [ ]      |
| Documented | [ ]   | [ ]       | [ ]      |

Use these labels:

```
F = Tested successfully in Floci
T = Tested through Terraform
A = AWS-specific / requires real AWS
C = Concept learned but not locally testable
```

---

# Overall Progress

## Phase 1 — Foundations

- [x] 01 Fundamentals
- [x] 02 AWS CLI
- [ ] 03 Terraform Basics

## Phase 2 — Core Services

- [ ] 04 IAM
- [ ] 05 S3
- [ ] 06 DynamoDB
- [ ] 07 EC2
- [ ] 08 VPC
- [ ] 09 RDS

## Phase 3 — Messaging & Serverless

- [ ] 10 SQS
- [ ] 11 SNS
- [ ] 12 Lambda
- [ ] 13 API Gateway

## Phase 4 — Observability

- [ ] 14 CloudWatch
- [ ] 15 CloudTrail

## Phase 5 — Storage & Delivery

- [ ] 16 Storage + CDN

## Phase 6 — Terraform Advanced

- [ ] 17 Terraform State
- [ ] 18 Terraform Modules
- [ ] 19 Terraform Environments

## Phase 7 — Security

- [ ] 20 Security

## Phase 8 — Reliability & Scaling

- [ ] 21 High Availability
- [ ] 22 Scaling

## Phase 9 — Architecture

- [ ] 23 AWS Architecture

## Phase 10 — Projects

- [ ] Project 01 — S3 Storage
- [ ] Project 02 — DynamoDB
- [ ] Project 03 — Messaging
- [ ] Project 04 — Serverless API
- [ ] Project 05 — Monitoring
- [ ] Project 06 — Final AWS Platform

---

# Definition of Done

The curriculum is complete when I can independently:

```
Understand an AWS service
        |
Use AWS CLI
        |
Automate with PowerShell
        |
Provision with Terraform
        |
Inspect Terraform state
        |
Troubleshoot failures
        |
Secure the resources
        |
Monitor the resources
        |
Combine services
        |
Design an AWS architecture
        |
Explain why each service was selected
```

The final goal is not simply:

> "I learned AWS."

The goal is:

> "I can provision, configure, operate, troubleshoot, secure, monitor, and document AWS infrastructure using AWS CLI, PowerShell, and Terraform."

---

# Learning Method

Every AWS service follows this workflow:

```
1. Understand the AWS concept
        |
2. Perform it using AWS CLI / PowerShell
        |
3. Perform the same task using Terraform
        |
4. Compare CLI vs Terraform
        |
5. Complete exercises
        |
6. Break/fail something intentionally
        |
7. Troubleshoot it
        |
8. Document evidence
        |
9. Build a small project
```

---

# Environment

| Tool               | Purpose                      |
| ------------------ | ---------------------------- |
| Windows PowerShell | Main shell                   |
| AWS CLI            | AWS API/service interaction  |
| Terraform          | Infrastructure as Code       |
| Floci              | Local AWS-compatible testing |
| Git                | Version control              |
| GitHub             | Learning evidence/portfolio  |

> Floci is the primary local lab environment. Not every AWS service or AWS feature necessarily has complete Floci support, so unsupported features should be marked as conceptual/AWS-only rather than pretending they were tested.
