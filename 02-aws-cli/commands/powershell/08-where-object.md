# Where-Object

Where-Object is used to filter items.

think:

```
Many items
   ↓
Where-Object
   ↓
Only items matching condition
```

Basic example

Suppose we have:

```
Get-ChildItem
```

Show only .txt files:

```
Get-ChildItem | Where-Object {
    $_.Extension -eq ".txt"
}
```

`$_`= current file.

AWS example

Our buckets are objects:

```
$buckets.Buckets
```

Filter buckets whose name starts with `demo`:

```
$buckets.Buckets | Where-Object {
    $_.Name -like "demo*"
}
```

If we have:

```
demo
demo-backup
test
```

result:

```
demo
demo-backup
```

Common conditions

```
$_.Name -eq "demo"       # exactly demo
$_.Name -ne "demo"       # not demo
$_.Name -like "demo*"    # starts with demo
$_.Name -like "*backup*" # contains backup
```

Practice with our bucket

Run:

```
$buckets.Buckets | Where-Object {
    $_.Name -eq "demo"
}
```

Then try:

```
$buckets.Buckets | Where-Object {
    $_.Name -ne "demo"
}
```

# `ForEach` vs `Where`

This distinction is important:

```
ForEach-Object → DO something with each item

Where-Object   → FILTER items
```

Example:

```
$buckets.Buckets |
    Where-Object { $_.Name -like "demo*" } |
    ForEach-Object { aws s3 ls "s3://$($_.Name)" }
```

here:

```
Buckets
   ↓
Where → keep matching buckets
   ↓
ForEach → run AWS command for each remaining bucket
```
