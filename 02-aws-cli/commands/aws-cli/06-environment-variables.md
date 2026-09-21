## Environment Variables

AWS CLI can read configuration and credentials from environment variables.

In this session we focus on there:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN
AWS_DEFAULT_REGION
AWS_PROFILE
AWS_PAGER
AWS_OUTPUT
```

## 1. View environment variables in PowerShell

```
$env:AWS_DEFAULT_REGION$env:AWS_DEFAULT_REGION
```

```
$env:AWS_PROFILE
```

Check all AWS-related variables:

```
Get-ChildItem Env:AWS*
```

## 2. Set a variable for the current PowerShell session

```
$env:AWS_DEFAULT_REGION = "us-east-1"
```

Verify:

```
$env:AWS_DEFAULT_REGION
```

Then:

```
aws configure list
```

floci output:

```
NAME       : VALUE                    : TYPE             : LOCATION
profile    : <not set>                : None             : None
access_key : ****************test     : env              :
secret_key : ****************test     : env              :
region     : us-east-1
```

## 3. Use environment variables with AWS CLI

Instead of:

```
aws s3 ls --region us-east-1
```

you can set:

```
$env:AWS_DEFAULT_REGION = "us-east-1"
```

Then:

```
aws s3 ls
```

AWS CLI can use the environment variable as its region configuration.

`*note: we already do that,when we configured floci`

## 4. Environment variable for output

Set:

```
$env:AWS_DEFAULT_OUTPUT = "json"
```

then:

```
aws s3 ls
```

You can test:

```
aws configure list
```

## 5. AWS Profile environment variable

`\*note: first you need create a profile then set, commands wont work on this session.check the next session profile.don't overwrite our working credentials.`

If you have multiple profiles:

```
$env:AWS_PROFILE = "myprofile"
```

Then:

```
aws sts get-caller-identity
```

The CLI uses that profile.
You can also specify it directly:

```
aws sts get-caller-identity --profile myprofile
```

\*if you messed up the floci setup, to remove profile use this command:
`Remove-Item Env:AWS_PROFILE`

Your existing Floci configuration should be used again

## 6. Credentials

AWS CLI can also obtain credentials through environment variables:

```
$env:AWS_ACCESS_KEY_ID
$env:AWS_SECRET_ACCESS_KEY
$env:AWS_SESSION_TOKEN
```

For our Floci setup, don't overwrite our working credentials.

The important concept is the credential precedence:

```
Command-line options
        ↓
Environment variables
        ↓
AWS profile/configuration
        ↓
Other AWS credential providers
```
