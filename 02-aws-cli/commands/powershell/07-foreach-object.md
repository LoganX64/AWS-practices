# ForEach-Object

ForEach-Object means:

`Take each item one by one and run a command/action on it.`

we already have:

```
$buckets = aws s3api list-buckets | ConvertFrom-Json
```

we bucket list contains:

```
demo
```

Basic example

```
$buckets.Buckets | ForEach-Object {
    $_.Name
}
```

output:

```
demo
```

## What is `$_`?

`$_`means the current item.
If you have:

```
bucket1
bucket2
bucket3
```

PowerShell effectively does:

```
$_ = bucket1 → run commands
$_ = bucket2 → run commands
$_ = bucket3 → run commands
```

Useful AWS example

List every bucket and print a message:

```
$buckets.Buckets | ForEach-Object {
    Write-Host "Bucket: $($_.Name)"
}
```

More practical example

Run an AWS command for each bucket:

```
$buckets.Buckets | ForEach-Object {
    aws s3 ls "s3://$($_.Name)"
}
```

If you have 3 buckets:

```
demo
test
backup
```

PowerShell runs:

```
aws s3 ls s3://demo
aws s3 ls s3://test
aws s3 ls s3://backup
```

That's the main purpose: automate the same operation across multiple AWS resources.
