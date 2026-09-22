# PowerShell — Objects

The key idea is:

`PowerShell commands usually don't pass plain text to the next command. They pass objects.`

## 1. First: what is an object?

Think of an object as a thing containing information about something.

For example, suppose PowerShell gives us information about a file:

```
Name        : hello.txt
Length      : 82
Extension   : .txt
Directory   : D:\practise\AWS-practices
```

Instead of PowerShell treating this as one big piece of text, it treats it as an object with properties.
we an think of it like this:

```
File Object
│
├── Name      → hello.txt
├── Length    → 82
├── Extension → .txt
└── Directory → D:\practise\AWS-practices
```

Each piece of information is called a property.

## 2. See this yourself

Run:

```
Get-ChildItem
```

we already used this when learning pipelines.
Now take one file:

```
Get-ChildItem hello.txt
```

we may see something like:

```
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----                ...                     82 hello.txt
```

It looks like a table.
But this is important:

```
The table we see is only PowerShell's way of displaying the object.
```

The underlying result is an object.

3. See the object's properties

Run:

```
Get-ChildItem hello.txt | Get-Member
```

we will see information about the object.

```
TypeName: System.IO.FileInfo

Name          MemberType
----          ----------
Name          Property
Length        Property
Extension     Property
FullName      Property
Directory     Property
LastWriteTime Property
...
```

This tells us:

```
Get-ChildItem
      │
      ▼
 FileInfo object
      │
      ├── Name
      ├── Length
      ├── Extension
      ├── FullName
      ├── Directory
      └── LastWriteTime
```

`Get-Member` is therefore extremely useful when learning PowerShell.

## 4. Access a property

Suppose:

```
$file = Get-ChildItem hello.txt
```

Now $file contains the file object.
we can access its properties:

```
$file.Name
```

output:

```
hello.txt
```

Try:

```
$file.Length
```

output:

```
82
```

Try:

```
$file.Extension
```

output:

```
.txt
```

Try:

```
$file.FullName
```

output:

```
D:\practise\AWS-practices\...\hello.txt
```

So: `$file` is the object.

and : `$file.Name,
$file.Length,
$file.Extension` are properties of that object.

## 5. This is different from a variable

eg:

```
$name = "hello.txt"
```

here:

```
$name
   │
   ▼
"hello.txt"
```

That's basically just a string.
But:

```
$file = Get-ChildItem hello.txt
```

gives you a much richer object:

```
$file
  │
  ▼
FileInfo object
  │
  ├── Name
  ├── Length
  ├── Extension
  ├── FullName
  ├── Directory
  └── LastWriteTime
```

## 6. Why objects are useful

Imagine we have 100 files.

we want files larger than 1 KB.

If everything were plain text, we would have to parse the displayed table/text.

PowerShell doesn't need to do that.

It already has:

```
File object
    │
    ├── Name
    ├── Length
    ├── Extension
    └── ...
```

So you can work directly with:

```
$_.Length
```

This becomes extremely useful with:

```
Where-Object
ForEach-Object
```

## 7. Objects + pipelines

Consider:

```
Get-ChildItem *.txt | Get-Member
```

The flow is:

```
Get-ChildItem
      │
      │ FileInfo objects
      ▼
   Pipeline
      │
      ▼
 Get-Member
```

PowerShell is passing objects through the pipeline.
