# Region Configuration

AWS CLI needs a region for regional services such as S3, EC2, RDS, etc.

There are several ways to provide it.

## 1. Check our current region

```
aws configure get region
```

For a specific profile:

```
aws configure get region --profile default
```

```
aws configure get region --profile myprofile
```

## 2. Set region in a profile

For our default profile:

```
aws configure set region us-east-1
```

For another profile:

```
aws configure set region us-west-2 --profile myprofile
```

Verify:

```
aws configure get region
```

```
aws configure get region --profile myprofile
```

## 3. --region

we can override the configured region for a single command:

```
aws s3 ls --region us-east-1
```

This doesn't change your profile configuration.

## 4. AWS_DEFAULT_REGION

we can set the region through a PowerShell environment variable:

```
$env:AWS_DEFAULT_REGION = "us-east-1"
```

Check:

```
$env:AWS_DEFAULT_REGION
```

## 5. Region precedence

remember this:

```
Command option
    --region
       ↓
Environment variable
    AWS_DEFAULT_REGION
       ↓
Profile configuration
    ~/.aws/config
```

## 6. Profile-specific regions

We can have:

```
default
  region = us-east-1

dev
  region = us-west-2
```

Then:

```
aws s3 ls --profile default
```

uses:

```
us-east-1
```

# Practice

```
PS D:\practise\AWS-practices> aws configure list
NAME       : VALUE                    : TYPE             : LOCATION
profile    : <not set>                : None             : None
access_key : ****************test     : env              :
secret_key : ****************test     : env              :
region     : us-east-1                : env              : ['AWS_REGION', 'AWS_DEFAULT_REGION']
PS D:\practise\AWS-practices> aws configure get region
us-east-1
PS D:\practise\AWS-practices> aws configure set region us-south-1
PS D:\practise\AWS-practices> aws configure get region
us-south-1
PS D:\practise\AWS-practices> aws s3 ls --region us-west-2
2026-09-21 18:33:02 s3-demo
PS D:\practise\AWS-practices> $env:AWS_DEFAULT_REGION = "us-south-1"
PS D:\practise\AWS-practices> aws configure list
NAME       : VALUE                    : TYPE             : LOCATION
profile    : <not set>                : None             : None
access_key : ****************test     : env              :
secret_key : ****************test     : env              :
region     : us-south-1               : env              : ['AWS_REGION', 'AWS_DEFAULT_REGION']
PS D:\practise\AWS-practices> Remove-Item Env:AWS_DEFAULT_REGION
PS D:\practise\AWS-practices> aws configure get region
us-south-1
PS D:\practise\AWS-practices>
```
