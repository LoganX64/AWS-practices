# Output Formats

AWS CLI supports three main output formats you'll use frequently:

```
json
table
text
```

## 1. JSON

Best for PowerShell, scripts, APIs, and structured data.

```
aws sts get-caller-identity --output json
```

example structure :

```
{
    "UserId": "...",
    "Account": "...",
    "Arn": "..."
}
```

## 2. Table

Best for human-readable terminal output.

```
aws sts get-caller-identity --output table
```

we will get a formatted table instead of JSON.

## 3. Text

Best for shell scripting and simple values.

```
aws sts get-caller-identity --output text
```

## Default output

Check what our CLI currently uses:

```
aws configure get output
```

we can explicitly change the format for one command without changing your configuration:

```
aws s3 ls --output json
```
