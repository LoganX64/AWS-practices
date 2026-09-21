## 1. Verify AWS CLI

```
aws --version
```

`Get-Command aws` -> is a Microsoft PowerShell command used to search for and display information about an installed command, function, or application named "aws" on your computer.

`aws help` -> command is used to access the built-in documentation and reference manual for the AWS Command Line Interface (AWS CLI) directly from your terminal.

## 2. AWS CLI structure

The basic structure is:

```
aws <command> <subcommand> [options]
```

eg: `aws s3 ls`

Breakdown:

```
aws
└── s3          ← command / service
    └── ls      ← subcommand
```

eg:

```
aws ec2 describe-instances --output table
```

```
aws
├── ec2                         ← command
├── describe-instances          ← subcommand
└── --output table              ← option
```

## 3. Practice

`aws s3 ls --help` and `aws s3 ls help` - Both variations will open the exact same built-in documentation page in your terminal.
-- help does not work on floci for now.

`aws s3 ls --output json` - It does not output a JSON block {}. It ignores your request for JSON.

`aws s3 ls --output text` - This looks identical to the other two outputs because text-like formatting is the only format aws s3 ls knows how to generate.

`aws s3 ls --output table`- Note that it does not draw an ASCII box-style table (which --output table normally does for other commands). It just displays the standard timestamp and bucket name text.
