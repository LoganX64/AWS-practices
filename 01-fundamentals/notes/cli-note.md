# AWS CLI Essential Commands Reference

## S3 Bucket Operations

### Listing and Basic Info
```bash
# List all S3 buckets
aws s3 ls

# List objects in a bucket (with optional prefix)
aws s3 ls s3://bucket-name/
aws s3 ls s3://bucket-name/folder/

# Get bucket location/region
aws s3api get-bucket-location --bucket bucket-name

# Check if bucket exists
aws s3api head-bucket --bucket bucket-name 2>/dev/null && echo "Exists" || echo "Does not exist"
```

### Bucket Creation and Management
```bash
# Create a new bucket
aws s3 mb s3://bucket-name

# Note: Buckets cannot be renamed directly. To "rename":
# 1. Create new bucket with desired name
# 2. Copy all objects from old to new
# 3. Delete old bucket (after verifying copy)
aws s3 mb s3://new-bucket-name
aws s3 sync s3://old-bucket-name s3://new-bucket-name
# Verify contents then:
aws s3 rb s3://old-bucket-name --force  # --force to delete non-empty bucket
```

### Object Operations (Most Useful for Daily Use)
```bash
# Upload a single file
aws s3 cp local-file.txt s3://bucket-name/

# Upload and rename in one step
aws s3 cp local-file.txt s3://bucket-name/new-name.txt

# Download a file
aws s3 cp s3://bucket-name/file.txt ./local-file.txt

# List objects recursively (useful for navigating folder structures)
aws s3 ls s3://bucket-name/ --recursive

# Copy object within same bucket (effective rename)
aws s3 cp s3://bucket-name/old-key s3://bucket-name/new-key

# Move object within same bucket (copy + delete)
aws s3 mv s3://bucket-name/old-key s3://bucket-name/new-key

# Delete a single object
aws s3 rm s3://bucket-name/file-to-delete.txt

# Delete multiple objects (specify keys in text file)
aws s3 rm s3://bucket-name/ --exclude "*" --include "prefix-*" 

# Sync local directory with S3 bucket
aws s3 sync ./local-folder s3://bucket-name/remote-folder/
# --delete removes files in S3 not present locally
# --exclude and --include for filtering
```

### Object Information and Metadata
```bash
# Get object metadata (size, last modified, storage class, etc.)
aws s3api head-object --bucket bucket-name --key object-key

# Get just the content length (size)
aws s3api head-object --bucket bucket-name --key object-key --query ContentLength --output text

# Get last modified date
aws s3api head-object --bucket bucket-name --key object-key --query LastModified --output text

# Check if object exists
aws s3api head-object --bucket bucket-name --key object-key 2>/dev/null && echo "Exists" || echo "Missing"
```

### Bucket Properties and Configuration
```bash
# Check bucket versioning status
aws s3api get-bucket-versioning --bucket bucket-name

# Check bucket encryption
aws s3api get-bucket-encryption --bucket bucket-name

# Check bucket policy
aws s3api get-bucket-policy --bucket bucket-name

# List bucket tags
aws s3api get-bucket-tagging --bucket bucket-name
```

## General AWS CLI Utilities

### Help and Discovery
```bash
# Get general AWS CLI help
aws help

# Get S3-specific help
aws s3 help

# Get help for a specific subcommand
aws s3 cp help
aws s3 ls help
```

### Configuration and Identity
```bash
# View current AWS CLI configuration
aws configure list

# Get current caller identity (useful to verify credentials)
aws sts get-caller-identity

# List available regions
aws ec2 describe-regions --query 'Regions[].RegionName' --output text

# Get account ID
aws sts get-caller-identity --query Account --output text
```

### Practical Workflow Examples

#### Common Development Workflow
```bash
# 1. Check what buckets exist
aws s3 ls

# 2. Create working bucket for session
aws s3 mb s3://temp-work-$(date +%s)

# 3. Upload files to work with
aws s3 cp ./data/ s3://temp-work-12345/data/ --recursive

# 4. Process/download as needed
aws s3 cp s3://temp-work-12345/data/results.txt ./local-results.txt

# 5. Clean up when done
aws s3 rb s3://temp-work-12345 --force
```

#### File Management Patterns
```bash
# Rename multiple objects with pattern
# List objects first to see what you're working with
aws s3 ls s3://bucket-name/prefix/ --recursive

# Then batch rename (example: add .bak extension)
aws s3 ls s3://bucket-name/ | 
  grep '\.txt$' | 
  awk '{print $4}' | 
  while read key; do
    aws s3 mv "s3://$bucket/$key" "s3://$bucket/$key.bak"
  done

# Find largest objects in bucket
aws s3 ls s3://bucket-name/ --recursive --human-readable --summarize |
  sort -k3 -h |
  tail -10

# Count objects in bucket
aws s3 ls s3://bucket-name/ --recursive | wc -l
```

## Pro Tips and Common Patterns

### Using JMESPath for Filtering
```bash
# List only objects modified in last 24 hours
aws s3api list-objects-v2 --bucket bucket-name \
  --query 'Contents[?LastModified>=`2026-09-20T00:00:00`].{Key:Key,Size:Size}' \
  --output table

# Get total size of all objects
aws s3api list-objects-v2 --bucket bucket-name \
  --query 'sum(Contents[].Size)' \
  --output text

# List objects larger than 10MB
aws s3api list-objects-v2 --bucket bucket-name \
  --query 'Contents[?Size > `10485760`].{Key:Key,Size:Size}' \
  --output table
```

### Working with Multiple Profiles
```bash
# Use specific AWS CLI profile
aws s3 ls --profile development

# List all configured profiles
aws configure list-profiles

# Set default profile temporarily
export AWS_PROFILE=development
```

### Error Handling in Scripts
```bash
# Check if bucket exists before creating
if ! aws s3api head-bucket --bucket "$BUCKET" 2>/dev/null; then
  echo "Bucket does not exist, creating..."
  aws s3 mb "s3://$BUCKET"
else
  echo "Bucket already exists"
fi

# Safe copy with error checking
if aws s3 cp "local.txt" "s3://$BUCKET/remote.txt"; then
  echo "Upload successful"
else
  echo "Upload failed"
  exit 1
fi
```