# Commands → Subcommands → Options

## 1. Commands

AWS services are accessed through commands:

```
aws s3
aws ec2
aws iam
aws sts
```

we can check the availability in help command:

`aws help`

## 2. Subcommands

A command is followed by an operation:

```
aws s3 ls
aws s3 mb s3://my-bucket
aws s3 rb s3://my-bucket

aws ec2 describe-instances
aws sts get-caller-identity
```

Pattern:

```
aws <service> <operation>
```

## 3. Options

Options modify how the command behaves:

```
aws s3 ls --output json
```

```
aws s3 ls --output table
```

```
aws s3 ls --region us-east-1
```

```
aws s3 ls --no-paginate
```

`*note: create a bucket(service) and run,else you may see nothing`

Common global options:

```
--output
--query
--region
--profile
--no-paginate
--debug
```
