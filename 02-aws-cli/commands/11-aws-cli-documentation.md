# Reading AWS CLI Documentation

This is the final item under CLI Fundamentals.

The goal is to learn how to use AWS documentation to discover commands rather than memorizing them.

## 1. AWS CLI Command Reference

Use the AWS CLI Command Reference:

https://docs.aws.amazon.com/cli/latest/reference/

The structure is:

```
AWS CLI
└── Services
    ├── S3
    ├── EC2
    ├── IAM
    ├── STS
    └── ...
```

For example:

```
S3
└── s3api
    └── list-buckets
```

## 2. Read a command's documentation

Example:

https://docs.aws.amazon.com/cli/latest/reference/s3api/list-buckets.html

Look for:

```
Synopsis
Options
Global Options
Output
Examples
```

The Synopsis tells us the command structure.

The Options tell us what arguments are available.

The Examples show realistic usage.

## 3. Compare documentation with --help

Terminal:

```
aws s3api list-buckets help
```

Online:

```
AWS CLI Command Reference
        ↕
aws <service> <command> help
```

They describe the same CLI interface, but the website is easier to search and navigate.

## 4. Documentation → command workflow

Practice this workflow:

```
Task
 ↓
Identify service
 ↓
Open AWS CLI Command Reference
 ↓
Find operation
 ↓
Read Synopsis
 ↓
Read Options
 ↓
Read Examples
 ↓
Test with Floci
 ↓
Use --query / --output if needed
```

## 5. Practice task

Suppose you want to list S3 buckets.

First find:

```
S3 → s3api → list-buckets
```

Then read the documentation.
Then run:

```
aws s3api list-buckets
```

Try:

```
aws s3api list-buckets --output table
```

Then:

```
aws s3api list-buckets --query "Buckets[].Name"
```

And:

```
aws s3api list-buckets --query "Buckets[].{Name:Name,Created:CreationDate}" --output table
```

Output:

```
PS D:\practise\AWS-practices> aws s3api list-buckets
{
    "Buckets": [
        {
            "Name": "s3-demo",
            "CreationDate": "2026-09-21T13:03:02+00:00"
        }
    ],
    "Owner": {
        "DisplayName": "owner",
        "ID": "owner"
    },
    "Prefix": null
}

PS D:\practise\AWS-practices> aws s3api list-buckets --output table
--------------------------------------------
|                ListBuckets               |
+----------------------+-------------------+
|  Prefix              |  None             |
+----------------------+-------------------+
||                 Buckets                ||
|+----------------------------+-----------+|
||        CreationDate        |   Name    ||
|+----------------------------+-----------+|
||  2026-09-21T13:03:02+00:00 |  s3-demo  ||
|+----------------------------+-----------+|
||                  Owner                 ||
|+------------------------+---------------+|
||       DisplayName      |      ID       ||
|+------------------------+---------------+|
||  owner                 |  owner        ||
|+------------------------+---------------+|

PS D:\practise\AWS-practices> aws s3api list-buckets --query "Buckets[].Name"
[
    "s3-demo"
]

PS D:\practise\AWS-practices> aws s3api list-buckets --query "Buckets[].{Name:Name,Created:CreationDate}" --output table
------------------------------------------
|               ListBuckets              |
+----------------------------+-----------+
|           Created          |   Name    |
+----------------------------+-----------+
|  2026-09-21T13:03:02+00:00 |  s3-demo  |
+----------------------------+-----------+

PS D:\practise\AWS-practices>
```
