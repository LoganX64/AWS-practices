# Scripts

A PowerShell script is a .ps1 file containing multiple PowerShell commands.

Instead of typing the same commands manually every time:

```
Type command 1
Type command 2
Type command 3
Type command 4
```

we put them into a script:

```
script.ps1
   ↓
runs command 1
runs command 2
runs command 3
runs command 4
```

## 1. Create a script

Go to our PowerShell practice folder:

create:

```
New-Item check-buckets.ps1
```

Open it:

```
notepad check-buckets.ps1
```

Put this inside:

```
$buckets = aws s3api list-buckets | ConvertFrom-Json

$buckets.Buckets | ForEach-Object {
    Write-Host "Bucket: $($_.Name)"
}
```

Save and close Notepad.

## 2. Run the script

```
.\check-buckets.ps1
```

we should get something like:

```
Bucket: demo
```

What just happened?

The script automatically performed:

```
aws s3api list-buckets
        ↓
JSON output
        ↓
ConvertFrom-Json
        ↓
PowerShell objects
        ↓
ForEach-Object
        ↓
print every bucket
```

So the important idea is:

`A script stores a repeatable sequence of commands so you can run the whole workflow with one command.`

## 3. Make it slightly more useful

Replace the script with:

```
$buckets = aws s3api list-buckets | ConvertFrom-Json

$buckets.Buckets | ForEach-Object {
    Write-Host "Checking bucket: $($_.Name)"
    aws s3 ls "s3://$($_.Name)"
}
```

Run:

```
.\check-buckets.ps1
```

we should see:

```
Checking bucket: demo
2026-09-22 ... file1.txt
2026-09-22 ... file2.txt
2026-09-22 ... file3.txt
```

Now we have combined the topics we've learned:

```
Variable
   ↓
AWS CLI
   ↓
JSON
   ↓
ConvertFrom-Json
   ↓
Objects
   ↓
ForEach-Object
   ↓
AWS commands
```

## 4. Why this matters for AWS

Later, instead of manually doing:

```
aws s3api list-buckets
aws s3 ls s3://bucket1
aws s3 ls s3://bucket2
aws s3 ls s3://bucket3
...
```

we can create:

```
check-buckets.ps1
```

and simply run:

```
.\check-buckets.ps1
```

That's the beginning of AWS automation with PowerShell.
