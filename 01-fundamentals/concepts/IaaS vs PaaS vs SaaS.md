# Service model

how much infrastructure you manage vs how much the cloud services manages it.

```

More control ◄──────────────────────────► Less control

IaaS        PaaS               FaaS         SaaS
│             │                  │           │
EC2         Elastic Beanstalk  Lambda       SaaS app
│             │                  │           │
You         Less               Just code    Just use it
manage      management
```

## IAAS — Infrastructure as a Service

IaaS gives you basic infrastructure such as:

- Virtual machines
- Storage
- Networking.

You have significant control over the environment.
AWS manages the underlying physical infrastructure, while you manage things such as the OS, installed software, application, and configuration.

Think:
`Give me a server. I'll manage it.`

AWS eg:

- EC2 — virtual machines
- EBS — block storage
- VPC — networking infrastructure

## PaaS — Platform as a Service

PaaS provides a platform for running applications while the cloud provider manages more of the underlying infrastructure.

Think:
`Give me a platform where I can deploy my application.`

aws eg:

- Elastic Beanstalk
- AWS App Runner — managed application deployment
- Amazon Lightsail — simplified cloud hosting, though its service model doesn't fit perfectly into a strict IaaS/PaaS classification

## SaaS — Software as a Service

SaaS gives you a complete software application.
You don't build or manage the underlying application infrastructure.
You simply use the software.

eg :Gmail, Slack ,Google Docs, Microsoft 365

Think: `I don't want to build it. I just want to use it.`

AWS eg :Amazon QuickSight — business intelligence/analytics, Amazon Connect — cloud contact center ,Amazon Chime — communications service

## FAAS / SERVERLESS

FaaS — Function as a Service
FaaS allows you to run individual functions without managing servers directly.
AWS manages the underlying compute infrastructure.
You primarily focus on your function code and configuration.
Serverless - means you don't directly manage the underlying servers. AWS manages the underlying infrastructure.
