# Error Handling

Error handling means: when a command fails, your script can detect the failure and decide what to do instead of blindly continuing.

For example:

```
aws s3 ls s3://wrong-bucket
```

may fail with:

```
PS D:\practise\AWS-practices\02-aws-cli\commands\powershell> aws s3 ls s3://wrong-bucket
aws: [ERROR]: An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist.
```

A script should be able to notice that.

## 1. `$?` — Did the last command succeed?

PowerShell provides `$?`.

```
aws s3 ls s3://demo

$?
```

If successful:

```
True
```

Try a bucket that doesn't exist:

```
aws s3 ls s3://does-not-exist

$?
```

so:

```
$? = True   → previous command succeeded
$? = False  → previous command failed
```

## 2. Use if

Now we can make a decision:

```
aws s3 ls s3://demo

if ($?) {
    Write-Host "Bucket check succeeded"
}
else {
    Write-Host "Bucket check failed"
}
```

This means:

```
Run AWS command
     ↓
Was it successful?
   ↙       ↘
 Yes       No
  ↓         ↓
success    failed
```

## 3. Practice with your Floci bucket

create:

```
notepad error-test.ps1
```

put this inside:

```
aws s3 ls s3://demo

if ($?) {
    Write-Host "S3 command succeeded"
}
else {
    Write-Host "S3 command failed"
}
```

Run:

```
.\error-test.ps1
```

we should see your files followed by:

```
S3 command succeeded
```

Now change the error-test.ps1:

```
aws s3 ls s3://demo
```

to:

```
aws s3 ls s3://does-not-exist
```

Run again:

```
.\error-test.ps1
```

we should see an error followed by:

```
S3 command failed
```

## Important

There are two related concepts:

`$?`

```
True / False
```

Answers:

`Did the previous command succeed?`

$LASTEXITCODE

```
0 / non-zero
```

Answers:

`What exit code did the external program return?`
