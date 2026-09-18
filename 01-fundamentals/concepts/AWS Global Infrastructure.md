# AWS Global Infrastructure

The main idea is to understand where AWS infrastructure exists and how you can design applications to survive failures and serve users efficiently.

```
                         AWS Global Infrastructure
                                  │
              ┌───────────────────┴───────────────────┐
              │                                       │
           Regions                              Edge Locations
              │                                       │
       ┌──────┼──────┐                           CloudFront
       │      │      │
      AZ     AZ     AZ
       │      │      │
        Data Centers
```

## AWS Regions

A Region is a separate geographic area containing AWS infrastructure.

`Region = geographic area containing AWS infrastructure.`

```
ap-south-1      → Mumbai
us-east-1       → N. Virginia
eu-west-1       → Ireland
ap-southeast-1  → Singapore
```

A Region contains multiple Availability Zones.

```
Region: ap-south-1
│
├── Availability Zone
├── Availability Zone
└── Availability Zone
```

what is the purpose of Region?

- Geographic distribution
- Lower latency for users
- Data residency requirements
- Fault isolation
- Different service availability
- Disaster recovery

## Availability Zones

An Availability Zone (AZ) is an isolated location within an AWS Region.

`AZ = isolated infrastructure location inside a Region.`

A Region has multiple AZs.

```
          Region
       ap-south-1
            │
     ┌──────┼──────┐
     ↓      ↓      ↓
    AZ-1   AZ-2   AZ-3
```

Each AZ consists of one or more data centers.

AZs are designed with independent infrastructure such as power and networking so that failures can be isolated.

Why are AZs important?

Suppose your application is running only in one AZ:

```
User
  │
  ▼
AZ-1
  │
 Go API
  │
 💥
```

If that AZ has a problem, your application can become unavailable.

Instead:

```
             Load Balancer
              /         \
             ↓           ↓
           AZ-1         AZ-2
         Go API        Go API
```

If one AZ becomes unavailable, traffic can be served from another AZ, assuming the architecture is configured appropriately.

## Edge Locations

Edge Locations are locations distributed around the world that AWS uses for edge services such as Amazon CloudFront.
They are positioned closer to users than the origin infrastructure in many cases.

Eg:

```
User
 │
 ▼
CloudFront Edge Location
 │
 ├── Cache hit → Return content
 │
 └── Cache miss
          │
          ▼
       Origin
      S3 / ALB / etc.
```

Suppose your website's images are stored in an S3 bucket.

Without Cloudfront: `users -> S3 origin`

with cloudfront: `users -> nearby edge location -> cache content`

this can reduce latency and reduce request to the origin.

```
Region        → AWS infrastructure area
AZ            → isolated location within Region
Edge Location → edge delivery location
```

## Points of Presence (PoPs)

A Point of Presence (PoP) is an AWS location used to provide network/edge connectivity closer to users.

PoPs are associated with AWS edge networking services.

`PoP = a location where AWS provides network/edge services closer to users.`

They include:

- Edge Locations
- Regional Edge Caches

## Regional Services

A regional service/resource operates within a particular AWS Region.
A resource created in one Region generally doesn't automatically exist in another Region.
If you want the application in another Region, you generally need to deploy/replicate the required resources there.

eg:
EC2 ,
RDS ,
VPC ,
EBS.

## Global Services

Some AWS services operate globally rather than being tied to a single Region.
eg:
IAM,
Route 53,
CloudFront,
AWS Organizations.

IAM users, groups, and policies are not managed by selecting a specific EC2-style Region.
`*Service scope can vary by feature/resource.`

## Region Selection

When deploying an application, choosing a Region is an architectural decision.

Consider :

1. Latency :
   Choose infrastructure reasonably close to your users.

2. Service availability :
   Not every AWS service or feature is available in every Region.
   Check AWS documentation before deciding.

3. Pricing :
   Prices can differ between Regions.

4. Data residency :
   Some applications have requirements about where data is stored.

5. Disaster recovery :
   You may choose an additional Region for disaster recovery.

6. Compliance :
   Organizations may have legal or regulatory requirements affecting where data can be processed or stored.

## Multi-AZ Architecture

Multi-AZ means deploying components across multiple Availability Zones within the same Region. The goal is to reduce dependence on a single AZ.
Multi-AZ architecture is primarily about high availability and fault isolation.

## Multi-Region Architecture

Multi-Region means deploying your application or its components across multiple AWS Regions.

This can be used for:

- Disaster recovery
- Geographic distribution
- Lower latency for geographically distributed users
- Business continuity

However, multi-Region architecture is considerably more complex.

# Multi-AZ vs Multi-Region

|                        | Multi-AZ                     | Multi-Region                                |
| ---------------------- | ---------------------------- | ------------------------------------------- |
| Scope                  | Same Region                  | Multiple Regions                            |
| Main purpose           | Availability/fault isolation | Regional resilience/geographic distribution |
| Example                | Mumbai AZ-1 + AZ-2           | Mumbai + Singapore                          |
| Complexity             | Lower                        | Higher                                      |
| Handles AZ failure     | Yes, if properly designed    | Yes                                         |
| Handles Region failure | No                           | Can, if designed for it                     |

`Multi-AZ: multiple AZs inside one Region`

`Multi-Region: multiple Regions, each potentially using multiple AZs.`
