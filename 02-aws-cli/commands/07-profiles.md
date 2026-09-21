# Profiles

A profile lets you keep separate AWS CLI configurations and credentials.
eg:

```
default
myprofile
dev
production
```

## 1. See existing profiles

```
aws configure list-profiles
```

Our Floci setup may currently have: `default`

Check the active configuration:

```
aws configure list
```

## 2. Create a profile

For practice, create myprofile:

```
aws configure --profile myprofile
```

It will ask for:

```
AWS Access Key ID:
AWS Secret Access Key:
Default region name:
Default output format:
```

The configuration is typically stored under:

```
$HOME\.aws\
├── credentials
└── config
```

## 3. Use a profile explicitly

```
aws sts get-caller-identity --profile myprofile
```

```
aws s3 ls --profile myprofile
```

The --profile option applies to that command only.

## 4. Use AWS_PROFILE

instead of repeating writing:

```
aws s3 ls --profile myprofile
aws sts get-caller-identity --profile myprofile
```

set:

```
$env:AWS_PROFILE = "myprofile"
```

now:

```
aws s3 ls
```

and:

```
aws sts get-caller-identity
```

use myprofile.
check:

```
aws configure list
```

You should see:

```
profile : myprofile : env
```

## 5. Override AWS_PROFILE

if:

```
$env:AWS_PROFILE = "myprofile"
```

then this:

```
aws sts get-caller-identity --profile default
```

uses default for that command.
so:

```
AWS_PROFILE
    ↓
myprofile

--profile default
    ↓
overrides AWS_PROFILE for this command
```

## 6. Remove the temporary environment variable

When finished:

```
Remove-Item Env:AWS_PROFILE
```

then:

```
aws configure list
```

# Practice

Run these sequentially:

```
aws configure list-profiles
```

output:

```
default
```

```
aws configure list
```

output:

```
NAME       : VALUE                    : TYPE             : LOCATION
profile    : <not set>                : None             : None
access_key : ****************test     : env              :
secret_key : ****************test     : env              :
region     : us-east-1                : env              : ['AWS_REGION', 'AWS_DEFAULT_REGION']
```

```
Get-ChildItem $HOME\.aws
```

output:

```
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        17-09-2026     13:27                cli
d-----        06-06-2026     11:49                sso
-a----        20-09-2026     12:55             47 config
-a----        20-09-2026     12:55             67 credentials
```

Create/use your practice profile:

```
aws configure --profile myprofile
```

output:

```
Tip: You can deliver temporary credentials to the AWS CLI using your AWS Console session by running the command 'aws login'.

AWS Access Key ID [None]: test
AWS Secret Access Key [None]: test
Default region name [None]: us-east-1
Default output format [None]: json
```

`*note: use temp test input`

Test it:

```
aws sts get-caller-identity --profile myprofile
```

output:

```
{
    "UserId": "000000000000",
    "Account": "000000000000",
    "Arn": "arn:aws:iam::000000000000:root"
}

```

Then:

```
$env:AWS_PROFILE = "myprofile"
```

```
aws sts get-caller-identity
```

output:

```
{
    "UserId": "000000000000",
    "Account": "000000000000",
    "Arn": "arn:aws:iam::000000000000:root"
}
```

then run:

```
aws configure list
```

output:

```
NAME       : VALUE                    : TYPE             : LOCATION
profile    : myprofile                : env              : ['AWS_PROFILE', 'AWS_DEFAULT_PROFILE']
access_key : ****************test     : env              :
secret_key : ****************test     : env              :
region     : us-east-1                : env              : ['AWS_REGION', 'AWS_DEFAULT_REGION']
```

then run:

```
aws configure list-profiles
```

output:

```
default
myprofile
```

finally:

```
Remove-Item Env:AWS_PROFILE
```

# Check the profile

use this commands on windows:

```
notepad $HOME\.aws\credentials
```

it will open the credentials of our profile in a notepad, where you can manually remove the profile. there is no delete profile command on aws.
