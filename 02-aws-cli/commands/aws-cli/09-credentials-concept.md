# Credentials Concept

AWS CLI credentials answer one question:

`Who is making the AWS API request?`

The main credential values are:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN   ← only for temporary credentials
```

## 1. Access Key ID

Identifies the credential.
Example format:
`AKIA...`

`*Never share your real value.`

## 2. Secret Access Key

The secret associated with the access key.

`AWS_SECRET_ACCESS_KEY`

Treat this like a password.

## 3. Session Token

Temporary credentials can also include:

`AWS_SESSION_TOKEN`

It's required when using temporary/session-based credentials.

## 4. Credentials vs Configuration

### Credentials

```
Access Key ID
Secret Access Key
Session Token
```

These establish identity/authentication.

### Configuration

```
Region
Output format
Profile
Pager
```

These control how/where the CLI operates.

Eg:

```
credentials
    ↓
Who am I?
    ↓
Access Key + Secret Key

configuration
    ↓
Where/how?
    ↓
Region + output + profile
```

## 5. Where credentials can come from

One common location is:

```
$HOME\.aws\credentials
```

Inspect the file structure without displaying the secrets:

```
Get-Content $HOME\.aws\credentials
```

## 6. Out current Floci setup

Our earlier output showed:

```
access_key : ****************test : env
secret_key : ****************test : env
```

That means our current credentials are coming from environment variables, not from the profile.

Check safely:

```
aws configure list
```

AWS CLI masks the sensitive values automatically.

We can also check whether the variables exist without printing them:

```
PS D:\practise\AWS-practices> [bool]$env:AWS_ACCESS_KEY_ID
True
PS D:\practise\AWS-practices> [bool]$env:AWS_SECRET_ACCESS_KEY
True
PS D:\practise\AWS-practices>
```

## 7. Credentials and profiles

A profile can contain credentials.

Eg:

```
credentials
│
├── [default]
│   ├── access key
│   └── secret key
│
└── [dev]
    ├── access key
    └── secret key
```

And configuration can contain:

```
config
│
├── [default]
│   └── region
│
└── [profile dev]
    └── region
```

Then:

```
aws s3 ls --profile dev
```

selects the dev configuration/credentials context.

## 8. Credential precedence

For this curriculum, remember the important ordering:

```
Command-line options
        ↓
Environment variables
        ↓
Assume-role / web identity providers
        ↓
AWS profile credentials
        ↓
Other credential providers
```

The key point for our setup is:

```
Environment credentials
        ↓
can take precedence over
        ↓
profile credentials
```

That's why our earlier:

```
aws configure list
```

showed:

```
access_key : ****************test : env
secret_key : ****************test : env
```

even though we have a default profile.

# Practice

```
PS D:\practise\AWS-practices> aws configure list
NAME       : VALUE                    : TYPE             : LOCATION
profile    : <not set>                : None             : None
access_key : ****************test     : env              :
secret_key : ****************test     : env              :
region     : us-south-1               : config-file      : ~/.aws/config
PS D:\practise\AWS-practices> [bool]$env:AWS_ACCESS_KEY_ID
True
PS D:\practise\AWS-practices> [bool]$env:AWS_SECRET_ACCESS_KEY
True
PS D:\practise\AWS-practices> [bool]$env:AWS_SESSION_TOKEN
False
PS D:\practise\AWS-practices> Test-Path $HOME\.aws\credentials
True
PS D:\practise\AWS-practices> Test-Path $HOME\.aws\config
True
PS D:\practise\AWS-practices> aws sts get-caller-identity
{
    "UserId": "000000000000",
    "Account": "000000000000",
    "Arn": "arn:aws:iam::000000000000:root"
}

PS D:\practise\AWS-practices>
```

`*note: this are floci credentials that why pasted it. this are confidential. do not post anywhere`
