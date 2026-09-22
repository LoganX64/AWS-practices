# Objects

What it means

PowerShell commands usually return objects containing properties.

```
Get-ChildItem
```

think:

```
File object
├── Name
├── Length
├── FullName
├── Extension
└── LastWriteTime
```

Access a property:

```
Get-ChildItem | Select-Object Name
```

or:

```
$file = Get-ChildItem test.txt
$file.Name
$file.Length
```

AWS example

AWS CLI normally gives JSON:

```
aws s3api list-buckets
```

Convert that JSON into PowerShell objects:

```
$buckets = aws s3api list-buckets | ConvertFrom-Json
```

Now:

```
$buckets.Buckets
```

Get bucket names:

```
$buckets.Buckets.Name
```

So the important idea is:

```
AWS CLI
   ↓
JSON
   ↓
ConvertFrom-Json
   ↓
PowerShell objects
   ↓
.Properties
```
