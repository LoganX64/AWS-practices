# JSON Conversion

JSON conversion means converting between JSON text and PowerShell objects.

## 1. JSON → PowerShell object

AWS CLI commonly returns JSON:

```
aws s3api list-buckets
```

Store it:

```
$json = aws s3api list-buckets
```

At this point $json is JSON text.
Convert it:

```
$buckets = $json | ConvertFrom-Json
```

Now `$buckets` is a PowerShell object.
Access data:

```
$buckets.Buckets
```

Bucket names:

```
$buckets.Buckets.Name
```

## 2. PowerShell object → JSON

```
$buckets.Buckets | ConvertTo-Json
```

we can also create our own object:

```
$data = [PSCustomObject]@{
    Name   = "demo"
    Region = "ap-south-1"
}
```

Convert it to JSON:

```
$data | ConvertTo-Json
```

Result:

```
{
  "Name": "demo",
  "Region": "ap-south-1"
}
```

The important difference

```
AWS CLI
   ↓
JSON text
   ↓ ConvertFrom-Json
PowerShell object
   ↓
Access .Name, .Buckets, etc.
   ↓ ConvertTo-Json
JSON text
```

Remember:

- `ConvertFrom-Json` = JSON → PowerShell object
- `ConvertTo-Json` = PowerShell object → JSON
