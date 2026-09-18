# what is cloud computing?

## definition

Cloud computing simple terms - instead of using/deploying your own physical server, you use someone else server over the internet.

## why it matters

- no upfront cost of hardware
- no need to manage/ maintain your server by yourself
- pay-as-you-go makes it cheap to use
- scaling becomes easy
- access from anywhere

## Real world analogy

renting a apartment instead of owning it
you pay monthly rent and landlord handles the maintenance

## Benefits

- cost saving
- Scalability
- global reach
- no burden of managing
- Faster deployment

# On-Premises vs Cloud

## On-Premises

The company owns or leases physical infrastructure and manages it. AWS provides on-premises deployment options using hybrid cloud services like AWS Outposts, which delivers native AWS infrastructure and services directly to your local data center.

## Cloud

The company uses infrastructure provided by a cloud provider.

# CapEx vs OpEx

These describe two different types of spending (terms).

## CapEx — Capital Expenditure

Money spent on assets that are expected to be used over a longer period. This is common in traditional on-premises infrastructure.
eg: company -> buys server, networking equipments,data centers -> Large upfront investment

## OpEx — Operational Expenditure

Money spent on ongoing operational usage.
eg: AWS resources ->Use them -> Pay for usage

# Elasticity

`Elasticity = resources adapt to changing demand.`
Elasticity means automatically or quickly increasing and decreasing resources according to demand. resources can go up and down based on demand.
eg : An e-commerce website receives huge traffic during a sale. AWS services such as "EC2 Auto Scaling" can help implement this.

# Scalability

Scalability is the ability of a system to handle increasing workload by adding resources. Two common approaches. `Scalability ≠ elasticity`

## Vertical Scaling

Increase the power of an existing machine. Also called `scaling up`.
eg. EC2 - 2 CPU 4GB RAM => EC2 - 4 CPU 8GB RAM

## Horizontal Scaling

Add more machines.Also called `scaling out`.
eg: go backend - 1 server => go backend - load balancer - 3 server

```
Vertical   → Bigger machine
Horizontal → More machines
```

# Availability

Availability means a system is accessible and operational when users need it. eg : `99% availability` means 99% of the time the system is available. Higher availability means less down time. AWS commonly uses `multiple Availability Zones` to improve availability.

# Fault Tolerance

Fault tolerance means a system can continue operating even when some component fails. eg: If AZ-1 fails, the application can continue through AZ-2.
`fault tolerance - designed a system that on failure will not bring down the whole system`

# Disaster Recovery

Process to recover the application and date after a failure has occurred.
eg: Data center failure,Region failure,Major infrastructure failure,Accidental data deletion, Ransomware/security incident

Important DR concepts:

- Backup
- Restore
- Replication
- RTO (Recovery Time Objective) - `How quickly should the system be restored?`
- RPO (Recovery Point Objective)- `How much data loss can the business tolerate?`

# Pay-as-you-go

AWS generally follows a pay-as-you-go model for many services. You use a resource → AWS charges according to the applicable pricing model. pricing may varies based on services
