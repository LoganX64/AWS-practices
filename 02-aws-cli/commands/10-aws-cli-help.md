# AWS CLI Help

AWS CLI has built-in documentation, so we can learn commands directly from the terminal.

## 1. Global help

```
aws help
```

This shows:

AWS services/commands
global options
general CLI information

Exit the help screen with: `q`

## 2. Service help

```
aws s3 help
```

```
aws ec2 help
```

```
aws iam help
```

## 3. Operation help

Go one level deeper:

```
aws s3 ls help
```

For API commands:

```
aws s3api list-buckets help
```

Or:

```
aws ec2 describe-instances help
```

## 4. Search within help

On Windows PowerShell, we can pipe help output:

```
aws s3 help | Select-String "bucket"
```

or:

```
aws ec2 describe-instances help | Select-String "filter"
```

This is useful when we don't remember the exact option name.

## 5. Help for global options

```
aws help
```

look for:

```
--region
--profile
--output
--query
--debug
--no-paginate
```

we can also inspect command-specific options:

```
aws s3api list-buckets help
```

## 6. Practical workflow

Instead of memorizing every AWS CLI command:

```
Need to do something
       ↓
Identify AWS service
       ↓
aws <service> help
       ↓
Find operation
       ↓
aws <service> <operation> help
       ↓
Check options
       ↓
Run command
```

eg:

```
aws s3 help
```

→ find list

```
aws s3api list-buckets help
```

→ find available options

```
aws s3api list-buckets --output table
```

# Practice

```
PS D:\practise\AWS-practices> aws help

aws
^^^

Description
***********

The AWS Command Line Interface is a unified tool to manage your AWS
services.

Synopsis
********

   aws [options] <command> <subcommand> [parameters]

Use *aws command help* for information on a specific command. Use *aws
help topics* to view a list of available help topics. The synopsis for
each command shows its parameters and their usage. Optional parameters
are shown in square brackets.

Global Options
**************
PS D:\practise\AWS-practices> aws s3 help

s3
^^

Description
***********

This section explains prominent concepts and notations in the set of
high-level S3 commands provided.

If you are looking for the low level S3 commands for the CLI, please
see the "s3api" command reference page.


Path Argument Type
==================

Whenever using a command, at least one path argument must be
specified.  There are two types of path arguments: "LocalPath" and
"S3Uri".

"LocalPath": represents the path of a local file or directory.  It can
be written as an absolute path or relative path.

PS D:\practise\AWS-practices> aws s3api list-buckets help

list-buckets
^^^^^^^^^^^^

Description
***********

Note: This operation is not supported for directory buckets.

Returns a list of all buckets owned by the authenticated sender of the
request. To grant IAM permission to use this operation, you must add
the "s3:ListAllMyBuckets" policy action.

For information about Amazon S3 buckets, see Creating, configuring,
and working with Amazon S3 buckets .

Warning: We strongly recommend using only paginated "ListBuckets" requests.
  Unpaginated "ListBuckets" requests are only supported for Amazon Web
  Services accounts set to the default general purpose bucket quota of
  10,000. If you have an approved general purpose bucket quota above
  10,000, you must send paginated "ListBuckets" requests to list your
  accountÔÇÖs buckets. All unpaginated "ListBuckets" requests will be
  rejected for Amazon Web Services accounts with a general purpose
  bucket quota greater than 10,000.
PS D:\practise\AWS-practices> aws s3api list-buckets help | Select-String "query"

using "--output text" and the "--query" argument on a paginated
response, the "--query" argument must extract data from the results of
the following query expressions: "Buckets"
   [--query <value>]
"--query" (string)
A JMESPath query to use in filtering the response data.
   aws s3api list-buckets --query "Buckets[].Name"
The query option filters the output of "list-buckets" down to only the

PS D:\practise\AWS-practices> aws s3api list-buckets help | Select-String "output"

using "--output text" and the "--query" argument on a paginated
   [--output <value>]
   affect the number of items returned in the command's output.
   The total number of items to return in the command's output. If the
   "NextToken" is provided in the command's output. To resume
output without sending an API request. If provided with no value or
yaml". If provided with the value "output", it validates the command
inputs and returns a sample output JSON for that command. The
"--output" (string)
The formatting style for command output.
Turn on/off color output.
Disable cli pager for output.
The formatting style for error output. By default, errors are
The query option filters the output of "list-buckets" down to only the
Output

PS D:\practise\AWS-practices> aws ec2 describe-instances help | Select-String "filter"

the specified instances. If you specify filters, the output includes
information for only those instances that meet the filter criteria. If
you do not specify instance IDs or filters, the output includes
   [--filters <value>]
"--filters" (list)
   The filters.
     This can only be used to filter by the primary IP address of the
     network interface attached to the instance. To filter by
     the filter "network-interface.addresses.private-ip-address" .
     the instance). Similar to the state-reason-code filter.
     resource. Use the tag key in the filter name and the tag value as
     the filter value. For example, to find all resources that have a
     "tag:Owner" for the filter name and "TeamA" for the filter value.
     filter to find all resources that have a tag with a specific key,
      A filter name and value pair that is used to return a more
      specific list of results from a describe operation. Filters can
      If you specify multiple filters, the filters are joined with an
      the specified filters.
      For more information, see List and filter using the CLI and API
         The name of the filter. Filter names are case-sensitive.
         The filter values. Filter values are case-sensitive. If you
         specify multiple values for a filter, the values are joined
A JMESPath query to use in filtering the response data.
**Example 2: To filter for instances with the specified type**
The following "describe-instances" example uses filters to scope the
       --filters Name=instance-type,Values=m5.large
For more information, see List and filter using the CLI in the *Amazon
**Example 3: To filter for instances with the specified type and
The following "describe-instances" example uses multiple filters to
       --filters Name=instance-type,Values=t2.micro,t3.micro Name=availability-zone,Values=us-east-2c
**Example 4: To filter for instances with the specified type and
perform the same filtering as the previous example. When filters get
       --filters file://filters.json
Contents of "filters.json":
**Example 5: To filter for instances with the specified Owner tag**
The following "describe-instances" example uses tag filters to scope
       --filters "Name=tag-key,Values=Owner"
**Example 6: To filter for instances with the specified my-team tag
The following "describe-instances" example uses tag filters to scope
       --filters "Name=tag-value,Values=my-team"
**Example 7: To filter for instances with the specified Owner tag and
The following "describe-instances" example uses tag filters to scope
       --filters "Name=tag:Owner,Values=my-team"
**Example 9: To filter instances of the specified type and only
The following "describe-instances" example uses filters to scope the
       --filters "Name=instance-type,Values=t2.micro" \
**Example 10: To filter instances of the specified type and only
       --filters Name=tag-key,Values=Name \
       --filters Name=tag-key,Values=Name ^
**Example 12: To filter to instances with the specified placement
The following "describe-instances" example filters the results to only
       --filters "Name=placement-group-name,Values=HDFS-Group-A"
"Name=placement-partition-number,Values=7"
**Example 13: To filter to instances that are configured to allow
The following "describe-instances" example filters the results to only
       --filters "Name=metadata-options.instance-metadata-tags,Values=enabled" \

PS D:\practise\AWS-practices>
```
