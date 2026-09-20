# AWS Practices - Floci Docker Instructions

This document provides instructions for running Floci (AWS local emulator) using Docker.

## Quick Start

### Using Docker Run

```bash
docker run -d --name floci \
  -p 4566:4566 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -u root \
  floci/floci:latest
```

### Using Docker Compose

Create a `compose.yaml` file:

```yaml
services:
  floci:
    image: floci/floci:latest
    ports:
      - "4566:4566"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

Then start Floci:

```bash
docker compose up -d
```

## Required Environment Variables

After starting Floci, configure your AWS CLI/SDK with these environment variables:

```bash
export AWS_ENDPOINT_URL="http://localhost:4566"
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
```

## Verification

Test that Floci is working correctly:

```bash
# List S3 buckets (should be empty initially)
aws s3 ls

# Create a bucket
aws s3 mb s3://my-test-bucket

# List buckets again
aws s3 ls

# Upload a file
echo "hello world" > hello.txt
aws s3 cp hello.txt s3://my-test-bucket/hello.txt

# List objects in bucket
aws s3 ls s3://my-test-bucket/

# Clean up
aws s3 rm s3://my-test-bucket/hello.txt
aws s3 rb s3://my-test-bucket
```

## Important Notes

### Docker Socket Requirement
The `-v /var/run/docker.sock:/var/run/docker.sock` volume mount is required for Docker-backed services like Lambda, RDS, Elasticache, etc.

### Persistence
By default, Floci uses in-memory storage. Data will be lost when the container stops. For persistent data:

```yaml
# Add to docker run command:
-v ./floci-data:/var/lib/floci \
-e FLOCI_STORAGE_MODE=persistent

# Or in compose.yaml:
services:
  floci:
    image: floci/floci:latest
    ports:
      - "4566:4566"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./floci-data:/var/lib/floci
    environment:
      - FLOCI_STORAGE_MODE=persistent
```

### Web Console
Access Floci's web console at: `http://localhost:4566/_floci/ui`

### Image Variants
- `floci/floci:latest` - Standard image
- `floci/floci:latest-compat` - Includes AWS CLI and boto3 pre-configured
- `floci/floci:latest-baseline` - ARM64 version

### Managing the Container
```bash
# Stop Floci
docker stop floci

# Remove Floci container
docker rm floci

# View logs
docker logs floci

# Restart Floci
docker start floci
```

## Terraform Integration

When using Terraform with Floci, configure your provider:

```hcl
provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3       = "http://localhost:4566"
    ec2      = "http://localhost:4566"
    lambda   = "http://localhost:4566"
    # Add other services as needed
  }
}
```

## Troubleshooting

### Common Issues
1. **Permission denied on docker socket**: Ensure you're running with `-u root` or have proper permissions to access `/var/run/docker.sock`
2. **Port already in use**: Change the port mapping (e.g., `-p 4567:4566`) and update `AWS_ENDPOINT_URL` accordingly
3. **Service not available**: Check container logs with `docker logs floci` for startup errors

### Checking Floci Status
```bash
# Check if container is running
docker ps | grep floci

# Check container health
docker inspect --format='{{.State.Status}}' floci

# View recent logs
docker logs --tail 50 floci
```

## Floci Features
- Emulates 68+ AWS services locally
- No AWS account or auth token required
- Free and open-source (MIT license)
- Drop-in replacement for LocalStack
- Real Docker execution for services requiring high fidelity (Lambda, RDS, etc.)
- Web console for resource inspection at `http://localhost:4566/_floci/ui`

For more information, visit the [Floci documentation](https://floci.io/floci/).