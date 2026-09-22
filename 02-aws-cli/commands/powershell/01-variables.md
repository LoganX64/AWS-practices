# PowerShell — Variables

## 1. What is a variable?

A variable stores a value so we can reuse it.

PowerShell variables start with $.

```
$bucket = "demo"
```

Display the value:

```
$bucket
```

Output:

```
demo
```

## 2. Variables with AWS CLI

Instead of repeatedly typing the bucket name:

```
aws s3 mb s3://demo
aws s3 ls s3://demo
aws s3 cp test.txt s3://demo/test.txt
```

store it:

```
$bucket = "demo"
```

Then:

```
aws s3 mb "s3://$bucket"
```

```
aws s3 ls "s3://$bucket"
```

```
aws s3 cp test.txt "s3://$bucket/test.txt"
```

The important idea is:

```
$bucket
   ↓
demo
   ↓
s3://$bucket
   ↓
s3://demo
```

## 3. Create data before testing

For the exercises, we'll create an S3 bucket and objects so that AWS CLI commands have something meaningful to return.

### Create variables

```
$bucket = "ps-variables-demo"
$region = "us-east-1"
```

### Create the bucket

```
aws s3 mb "s3://$bucket" --region $region
```

### Create test files

```
"Hello from PowerShell" | Out-File file1.txt
"Learning AWS CLI" | Out-File file2.txt
"Floci testing" | Out-File file3.txt
```

### Upload them

```
aws s3 cp file1.txt "s3://$bucket/"
aws s3 cp file2.txt "s3://$bucket/"
aws s3 cp file3.txt "s3://$bucket/"
```

Now:

```
aws s3 ls "s3://$bucket"
```

we should have actual objects to see.

## 4. Different types of variables

PowerShell variables can store different kinds of values.

### String

```
$bucket = "ps-variables-demo"
```

### Number

```
$count = 3
```

### Boolean

```
$enabled = $true
```

Check them:

```
$bucket
$count
$enabled
```

## 5. Variables can store command output

This is very important for AWS automation.

Run:

```
$objects = aws s3 ls "s3://$bucket"
```

Now $objects contains the output from AWS CLI.
Display it:

```
$objects
```

we should see your uploaded files.
check its type:

```
$objects.GetType()
```

## 6. Variables can be reused

For example:

```
$bucket = "ps-variables-demo"
```

Use it several times:

```
aws s3 ls "s3://$bucket"
```

```
aws s3 cp file1.txt "s3://$bucket/"
```

```
aws s3 rm "s3://$bucket/file1.txt"
```

The advantage is that if the bucket name changes, you only change:

```
$bucket = "another-bucket"
```

instead of changing every command.

## 7. Variable interpolation

PowerShell substitutes variables inside double quotes:

```
$bucket = "ps-variables-demo"

"s3://$bucket"
```

Output:

```
s3://ps-variables-demo
```

This is useful with AWS CLI:

```
aws s3 ls "s3://$bucket"
```

Single quotes

```
's3://$bucket'
```

So:

```
"..."  → variable is expanded
'...'  → variable is treated literally
```

## 8. Variable containing a complete AWS CLI result

```
$list = aws s3 ls "s3://$bucket"
```

Then:

```
$list
```

You can also save the result:

```
$list | Out-File bucket-list.txt
```

Check the file:

```
Get-Content bucket-list.txt
```

This is the beginning of using PowerShell to automate AWS CLI.
