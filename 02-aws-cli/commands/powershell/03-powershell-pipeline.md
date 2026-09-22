# PowerShell — Pipelines

## 1. What is a pipeline?

A PowerShell pipeline is:

```
COMMAND-1 | COMMAND-2
```

The output from the first command is passed directly to the second command.
Think of it as:

```
Command 1
   ↓
output
   ↓
Command 2
   ↓
output
```

For example:

```
Get-Process | Where-Object CPU -gt 100
```

means:

```
Get-Process
     ↓
all processes
     ↓
Where-Object
     ↓
only processes with CPU > 100
```

The important thing about PowerShell is that the pipeline normally passes objects, not just plain text.

## 2. First pipeline

Let's start without AWS.
Run:

```
"apple","banana","orange","mango" | Sort-Object
```

we should get:

```
apple
banana
mango
orange
```

Here:`"apple","banana","orange","mango"` produces four values.

Then:`Sort-Object` receives those values through the pipeline.

So:

```
apple
banana
orange
mango
       ↓
Sort-Object
       ↓
apple
banana
mango
orange
```

## 3. Pipeline with AWS CLI

Now let's use our existing demo bucket.

First verify it exists:

```
aws s3 ls
```

we should see something similar to:
`2026-09-21  demo`

else create one bucket:

```
aws s3 mb s3://demo
```

## 4. Create test files

We'll create three files so our pipeline has something useful to work with.
run:

```
"file one" | Out-File -Encoding utf8 file1.txt
"file two" | Out-File -Encoding utf8 file2.txt
"file three" | Out-File -Encoding utf8 file3.txt
```

check them:

```
Get-ChildItem *.txt
```

we should see:

```
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        22-09-2026     19:15             13 file1.txt
-a----        22-09-2026     19:15             13 file2.txt
-a----        22-09-2026     19:15             15 file3.txt

```

## 5. Upload using a pipeline

Now here's an important distinction.
This:

```
Get-ChildItem *.txt
```

produces PowerShell FileInfo objects.
We can pipe them into another PowerShell command:

```
Get-ChildItem *.txt | ForEach-Object {
    $_.Name
}
```

Output:

```
file1.txt
file2.txt
file3.txt
```

## 6. A simple AWS pipeline

AWS CLI commands return text/JSON to PowerShell.
try:

```
aws s3 ls s3://demo
```

If the bucket is currently empty, that's actually okay. It will simply return nothing.

So let's upload our files first:

```
aws s3 cp file1.txt s3://demo/
aws s3 cp file2.txt s3://demo/
aws s3 cp file3.txt s3://demo/
```

Now:

```
aws s3 ls s3://demo
```

we should see something like:

```
2026-09-22 19:20:01         13 file1.txt
2026-09-22 19:20:02         13 file2.txt
2026-09-22 19:20:03         15 file3.txt
```

## 7. Pipeline the AWS output

Now run:

```
aws s3 ls s3://demo | Sort-Object
```

Here:

```
aws s3 ls s3://demo
        ↓
S3 listing
        ↓
Sort-Object
        ↓
sorted listing
```

This is your first useful AWS + PowerShell pipeline.

## 8. Pipeline into Where-Object

we haven't learned Where-Object yet, so don't worry about mastering it.

We're just seeing what a pipeline eventually allows us to do.

For example:

```
aws s3 ls s3://demo | Where-Object { $_ -match "file1" }
```

we should get the line containing:

```
2026-09-22 19:20:01         13 file1.tx
```

The important part for this chapter is the structure:

```
aws s3 ls s3://demo | Where-Object { ... }
```

The | means:

`Take the output from aws s3 ls and send it to Where-Object.`

## 9. Pipeline with local files

Let's make the concept easier before doing more AWS commands.
run:

```
Get-ChildItem *.txt | Sort-Object Name
```

This means:

```
Get-ChildItem *.txt
        ↓
find all .txt files
        ↓
Sort-Object Name
        ↓
sort them by filename
```

Now:

```
Get-ChildItem *.txt | Select-Object Name,Length
```

Output will look similar to:

```
Name Length
---
file1.txt 13
file2.txt 13
file3.txt 15

```

This is where PowerShell becomes different from a traditional shell.

## 10. Multiple pipeline commands

we can chain several commands:

```
Get-ChildItem *.txt |
    Sort-Object Length |
    Select-Object Name,Length
```

Think of it as:

```
Get-ChildItem
      ↓
all .txt files
      ↓
Sort-Object
      ↓
sorted by size
      ↓
Select-Object
      ↓
only Name + Length
```

we can have:

```
Command 1
   ↓
Command 2
   ↓
Command 3
   ↓
Command 4
```

That's the main idea of a PowerShell pipeline.

## 11. AWS example with JSON

Run:

```
aws s3api list-objects-v2 --bucket demo --output json
```

We should get JSON containing your objects.

Something similar to:

```
{
    "Contents": [
        {
            "Key": "file1.txt",
            "LastModified": "2026-09-22T13:50:01+00:00",
            "ETag": "\"c95ff9e6f28ccd11a870172612e3137c\"",
            "Size": 13,
            "StorageClass": "STANDARD"
        },
        {
            "Key": "file2.txt",
            "LastModified": "2026-09-22T13:50:02+00:00",
            "ETag": "\"7ad2cec798e90dc991020479939d6214\"",
            "Size": 13,
            "StorageClass": "STANDARD"
        },
        {
            "Key": "file3.txt",
            "LastModified": "2026-09-22T13:50:03+00:00",
            "ETag": "\"2aa68be821cacae106283c1d40f19ab7\"",
            "Size": 15,
            "StorageClass": "STANDARD"
        }
    ],
    "RequestCharged": null,
    "Prefix": ""
}
```

Now PowerShell can receive that output.
imp: `AWS CLI's JSON output is initially just text from PowerShell's point of view.`

## 12. Pipeline vs normal commands

Without pipeline:

```
Get-ChildItem *.txt
```

we get the files.
With pipeline:

```
Get-ChildItem *.txt | Sort-Object Length -Descending
```

we get the files and send them somewhere else.

With multiple stages:

```
Get-ChildItem *.txt |
    Sort-Object Name |
    Select-Object Name,Length
```

we are building a small processing workflow.
