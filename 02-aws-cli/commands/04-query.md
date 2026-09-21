# --query

--query uses JMESPath to select, filter, and reshape data from an AWS CLI response.

## 1. Get the complete response

```
aws sts get-caller-identity --output json
```

we might get:

```
{
    "UserId": "000000000000",
    "Account": "000000000000",
    "Arn": "arn:aws:iam::000000000000:root"
}

```

## 2. Select one field

```
aws sts get-caller-identity --query Account
```

output: `"000000000000"`

```
aws sts get-caller-identity --query Arn
```

output: `"arn:aws:iam::000000000000:root"`

## 3. Use JSON output

```
aws sts get-caller-identity --query Account --output json
```

output: `"000000000000"`

## 4. Multiple fields

```
aws sts get-caller-identity --query "[UserId, Account, Arn]"
```

output:

```
[
    "000000000000",
    "000000000000",
    "arn:aws:iam::000000000000:root"
]
```

```
aws sts get-caller-identity --query "{User: UserId, Account: Account, ARN: Arn}"
```

output:

```
{
    "User": "000000000000",
    "Account": "000000000000",
    "ARN": "arn:aws:iam::000000000000:root"
}
```

## 5. Query S3

```
aws s3api list-buckets --query "Buckets[].Name"
```

output:

```
[
    "s3-demo"
]
```

More useful:

```
aws s3api list-buckets --query "Buckets[].{Name:Name,Created:CreationDate}"
```

output:

```
[
    {
        "Name": "s3-demo",
        "Created": "2026-09-21T13:03:02+00:00"
    }
]
```

`*note: create a service(in this case bucket) and run the commands else you might see nothing`

## Important distinction

```
--output
    Controls HOW the result is displayed.

--query
    Controls WHICH data is returned.
```

eg:

```
aws s3api list-buckets --query "Buckets[].Name" --output table
```

output:

```
-------------
|ListBuckets|
+-----------+
|  s3-demo  |
+-----------+
```

means:

```
AWS response
     ↓
--query
     ↓
select bucket names
     ↓
--output table
     ↓
display as table
```
