# Filter

One important correction first: --filter is not a universal AWS CLI global option.

Filtering in AWS CLI generally happens in two places:

```
1. Service/API-side filtering
   → options specific to that AWS service command

2. Client-side filtering
   → --query
```

## 1. Find filter options

eg:

```
aws ec2 describe-instances --help
```

Look for options such as:
` -- filter`

The syntax is typically:

```
--filters Name=<attribute>,Values=<value>
```

eg:

```
aws ec2 describe-instances --filters Name=instance-state-name,Values=running
```

This asks the EC2 API to return instances matching the filter.

## 2. Multiple filters

```
aws ec2 describe-instances --filters `
    Name=instance-state-name,Values=running `
    Name=instance-type,Values=t2.micro
```

PowerShell's backtick ` continues the command onto the next line.

single line:

```
aws ec2 describe-instances --filters Name=instance-state-name,Values=running Name=instance-type,Values=t2.micro
```

## 3. --filters vs --query

This distinction is important:

```
--filters
    API/service-side filtering
    ↓
    AWS service returns matching resources

--query
    AWS CLI-side filtering/selection
    ↓
    CLI receives response and selects data
```

Conceptually:

```
                    AWS CLI
                       │
                       ▼
             AWS service/API request
                       │
                 --filters
                       │
                       ▼
                 API response
                       │
                    --query
                       │
                       ▼
                  --output
```

## 4. Check supported filters

Every AWS commands does not support --filter.
check:

`aws <service> <command> --help`

eg:

```
aws ec2 describe-instances --help
```

Then search the help output for:

`--filter`

### Floci note

Because we're using Floci, some AWS services or individual API filters may not be implemented exactly like real AWS. Floci does not supports `--help`, instead use `help`

# Practice

Run:

```
aws ec2 describe-instances help
```

Output:

```
describe-instances
^^^^^^^^^^^^^^^^^^


Description
***********

Describes the specified instances or all instances.

If you specify instance IDs, the output includes information for only
the specified instances. If you specify filters, the output includes
information for only those instances that meet the filter criteria. If
you do not specify instance IDs or filters, the output includes
information for all instances, which can affect performance. We
recommend that you use pagination to ensure that the operation returns
quickly and successfully.

The response includes SQL license exemption status information for
instances registered with the SQL LE service, providing visibility
into license exemption configuration and status.

If you specify an instance ID that is not valid, an error is returned.
If you specify an instance that you do not own, it is not included in
the output.

Recently terminated instances might appear in the returned results.
This interval is usually less than one hour.

If you describe instances in the rare case where an Availability Zone
is experiencing a service disruption and you specify instance IDs that
are in the affected zone, or do not specify any instance IDs at all,
the call fails. If you describe instances and specify only instance
IDs that are in an unaffected zone, the call works normally.

The Amazon EC2 API follows an eventual consistency model. This means
that the result of an API command you run that creates or modifies
resources might not be immediately available to all subsequent
commands you run. For guidance on how to manage eventual consistency,
see Eventual consistency in the Amazon EC2 API in the *Amazon EC2
Developer Guide* .

Warning: We strongly recommend using only paginated requests. Unpaginated
  requests are susceptible to throttling and timeouts.

Note: The order of the elements in the response, including those within
  nested structures, might vary. Applications should not assume the
  elements appear in a particular order.

See also: AWS API Documentation

"describe-instances" is a paginated operation. Multiple API calls may
be issued in order to retrieve the entire data set of results. You can
disable pagination by providing the "--no-paginate" argument. When
using "--output text" and the "--query" argument on a paginated
response, the "--query" argument must extract data from the results of
the following query expressions: "Reservations"


Synopsis
********

     describe-instances
   [--instance-ids <value>]
   [--include-managed-resources | --no-include-managed-resources]
   [--dry-run | --no-dry-run]
   [--filters <value>]          → --filter support
   [--cli-input-json | --cli-input-yaml]
   [--starting-token <value>]
   [--page-size <value>]
   [--max-items <value>]
   [--generate-cli-skeleton <value>]
   [--debug]
   [--endpoint-url <value>]
   [--no-verify-ssl]
   [--no-paginate]
   [--output <value>]
   [--query <value>]
   [--profile <value>]
   [--region <value>]
   [--version <value>]
   [--color <value>]
   [--no-sign-request]
   [--ca-bundle <value>]
   [--cli-read-timeout <value>]
   [--cli-connect-timeout <value>]
   [--cli-binary-format <value>]
   [--no-cli-pager]
   [--cli-auto-prompt]
   [--no-cli-auto-prompt]
   [--cli-error-format <value>]


```

second command:

```
aws s3api list-buckets help
```

Output:

```

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

Warning: You must URL encode any signed header values that contain spaces.
  For example, if your header value is "my file.txt" , containing two
  spaces after "my" , you must URL encode this value to
  "my%20%20file.txt" .

See also: AWS API Documentation

"list-buckets" is a paginated operation. Multiple API calls may be
issued in order to retrieve the entire data set of results. You can
disable pagination by providing the "--no-paginate" argument. When
using "--output text" and the "--query" argument on a paginated
response, the "--query" argument must extract data from the results of
the following query expressions: "Buckets"


Synopsis
********

     list-buckets
   [--prefix <value>]
   [--bucket-region <value>]
   [--cli-input-json | --cli-input-yaml]
   [--starting-token <value>]
   [--page-size <value>]
   [--max-items <value>]
   [--generate-cli-skeleton <value>]
   [--debug]
   [--endpoint-url <value>]
   [--no-verify-ssl]
   [--no-paginate]
   [--output <value>]
   [--query <value>]
   [--profile <value>]
   [--region <value>]
   [--version <value>]
   [--color <value>]
   [--no-sign-request]
   [--ca-bundle <value>]
   [--cli-read-timeout <value>]
   [--cli-connect-timeout <value>]
   [--cli-binary-format <value>]
   [--no-cli-pager]
   [--cli-auto-prompt]
   [--no-cli-auto-prompt]
   [--cli-error-format <value>]
```

the second command we run does not support `--filter`.

practice combining filtering/querying where supported:

```
aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[].Instances[].InstanceId"
```

`*note:it will nothing if no ec2 instance is running currently`
