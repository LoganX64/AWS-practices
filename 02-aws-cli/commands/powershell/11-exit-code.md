# Exit Codes

An exit code is a number returned by a command/program to tell you whether it succeeded or failed.

For command-line programs, the usual convention is:

```
0      → success
non-0  → failure
```

In PowerShell, for external programs like aws, we can read the exit code using:

```
$LASTEXITCODE
```

## 1. Test a successful AWS command

Run:

```
aws s3 ls s3://demo
```

Then immediately:

```
$LASTEXITCODE
```

we should get:

```
0
```

Meaning:

```
AWS command
    ↓
success
    ↓
exit code = 0
```

## 2. Test a failed command

run:

```
aws s3 ls s3://does-not-exist
```

Then:

```
$LASTEXITCODE
```

we should get a non-zero number.

The exact value can depend on the program, but the important rule is:

```
0       = success
anything other than 0 = failure
```

## 3. Use it in a script

Create:

```
notepad exit-test.ps1
```

Put:

```
aws s3 ls s3://demo

if ($LASTEXITCODE -eq 0) {
    Write-Host "AWS command succeeded"
}
else {
    Write-Host "AWS command failed"
}
```

Run:

```
.\exit-test.ps1
```

we should see:

```
file1.txt
file2.txt
file3.txt
AWS command succeeded
```

Now change the bucket to:

```
aws s3 ls s3://does-not-exist
```

Run again:

```
.\exit-test.ps1
```

we should see the AWS error followed by:

```
AWS command failed
```

`$?` vs `$LASTEXITCODE`

This is the important distinction:

```
|         | `$?`                                       | `$LASTEXITCODE`                                 |
| ------- | ------------------------------------------ | ----------------------------------------------- |
| Type    | Boolean                                    | Number                                          |
| Values  | `True` / `False`                           | `0`, `1`, etc.                                  |
| Purpose | Did the last PowerShell operation succeed? | What exit code did the external program return? |
| AWS CLI | Useful                                     | **Very useful**                                 |
```

For AWS CLI automation, you'll commonly use:

```
if ($LASTEXITCODE -ne 0) {
    Write-Host "AWS command failed"
}
```

The `-ne` means not equal.
