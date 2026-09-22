# PowerShell — Environment Variables

## 1. First: normal variable

We already learned:

```
$bucket = "ps-variables-demo"
```

This creates a PowerShell variable.
we can use it:

```
$bucket
```

output:

```
ps-variables-demo
```

This variable belongs to our current PowerShell session.

## 2. What is an environment variable?

An environment variable is a value stored in the environment where a program runs.
For example, our computer can have environment variables such as:

```
PATH
USERNAME
TEMP
HOME
AWS_REGION
AWS_ACCESS_KEY_ID
```

Programs can read these values.

## 3. PowerShell syntax

Environment variables use:

```
$env:NAME
```

try:

```
$env:USERNAME
```

This will show our Windows username.

try:

```
$env:PATH
```

we'll get a long list of directories.

## 4. Normal variable vs environment variable

Compare these.

Normal variable

```
$region = "us-east-1"
```

read it:

```
$region
```

Environment variable

```
$env:AWS_REGION = "us-east-1"
```

read it

```
$env:AWS_REGION
```

The syntax tells us which one we're dealing with:

```
$region
   ↑
normal PowerShell variable

$env:AWS_REGION
    ↑
environment variable
```

## 5. Why does AWS CLI care about environment variables?

AWS CLI can obtain configuration from several places.

One source is environment variables. eg:`$env:AWS_REGION = "us-east-1"`

Now AWS CLI can read that environment variable.

Check:

```
aws configure list
```

we may see the region coming from an environment variable.

## 6. Setting an environment variable

Use:

```
$env:AWS_REGION = "us-east-1"
```

## 7. Environment variables exist outside your script's normal variables

Environment variables once set can be used by another program/ powershell but it can not done using normal variables.

## 8. Why is this useful for scripts?

Imagine you write a script:

```
aws s3api list-buckets --region us-east-1
```

You've hard-coded the region.

Instead:

```
aws s3api list-buckets --region $env:AWS_REGION
```

Now the script uses the environment's configuration.
no we can change:

```
$env:AWS_REGION = "us-east-1"
```

without changing the script.
This is useful when the same script needs to run in different environments.

## 9. AWS credentials and environment variables

AWS CLI can use environment variables such as:

```
$env:AWS_ACCESS_KEY_ID
$env:AWS_SECRET_ACCESS_KEY
$env:AWS_SESSION_TOKEN
```

## 10. Temporary environment variables

This is an important PowerShell behavior.
when you run:

```
$env:AWS_REGION = "us-east-1"
```

you are setting it for the current PowerShell process/session.

## 11. Environment variables can be used by programs

This is the major difference.
Try:

```
$env:MY_TEST_VALUE = "hello-from-powershell"
```

Then:

```
python -c "import os; print(os.environ.get('MY_TEST_VALUE'))"
```

If Python is installed, it should print:

```
hello-from-powershell
```

the flow is:

```
PowerShell
    │
    │ sets
    ↓
MY_TEST_VALUE
    │
    │ inherited by
    ↓
Python
    │
    ↓
reads MY_TEST_VALUE
```

This is why environment variables are commonly used for application configuration.

## 12. The most important use: configuration

Think of environment variables primarily as configuration.
for eg:

```
Application
    │
    ├── AWS_REGION
    ├── DATABASE_URL
    ├── API_URL
    └── LOG_LEVEL
```

Instead of putting configuration directly inside our application code, the environment can provide it.
For AWS CLI:

```
Environment
    │
    ├── AWS_REGION
    ├── AWS_ACCESS_KEY_ID
    └── AWS_SECRET_ACCESS_KEY
             ↓
          AWS CLI
```

This concept becomes very important later with:

- Docker
- Kubernetes
- CI/CD
- GitHub Actions
- AWS deployments
