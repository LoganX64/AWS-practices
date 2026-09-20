# AWS Practices - Floci Docker Instructions

This document provides instructions for running Floci (AWS local emulator) using Docker.

## Quick Start

### Using Docker Run

#### Linux/macOS/Git Bash:
```bash
docker run -d --name floci \
  -p 4566:4566 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -u root \
  floci/floci:latest
```

#### Windows PowerShell:
```powershell
docker run -d --name floci `
  -p 4566:4566 `
  -v //var/run/docker.sock:/var/run/docker.sock `
  -u root `
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

#### Linux/macOS/Git Bash:
```bash
export AWS_ENDPOINT_URL="http://localhost:4566"
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
```

#### Windows PowerShell:
```powershell
$env:AWS_ENDPOINT_URL="http://localhost:4566"
$env:AWS_ACCESS_KEY_ID="test"
$env:AWS_SECRET_ACCESS_KEY="test"
$env:AWS_DEFAULT_REGION="us-east-1"
```

## Verification

Prerequisite: Ensure you have AWS CLI installed and configured to use the environment variables.

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
- On Linux/macOS: `-v /var/run/docker.sock:/var/run/docker.sock`
- On Windows (PowerShell): `-v //var/run/docker.sock:/var/run/docker.sock`
- On Windows (Command Prompt): `-v /var/run/docker.sock:/var/run/docker.sock`

### Persistence
By default, Floci uses in-memory storage. Data will be lost when the container stops. For persistent data:

#### Docker Run:
```bash
# Linux/macOS
docker run -d --name floci \
  -p 4566:4566 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/floci-data:/var/lib/floci \
  -e FLOCI_STORAGE_MODE=persistent \
  -u root \
  floci/floci:latest

# Windows PowerShell
docker run -d --name floci `
  -p 4566:4566 `
  -v //var/run/docker.sock:/var/run/docker.sock `
  -v ${pwd}\floci-data:/var/lib/floci `
  -e FLOCI_STORAGE_MODE=persistent `
  -u root `
  floci/floci:latest
```

#### Docker Compose:
```yaml
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
- `floci/floci:latest` - Standard image (recommended for most users)
- `floci/floci:latest-compat` - Includes AWS CLI and boto3 pre-configured (useful if you want to run aws commands inside the container)
- `floci/floci:latest-baseline` - ARM64 version (for Raspberry Pi 4 or other ARM64 devices)

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

When using Terraform with Floci, configure your provider. Since Floci automatically routes requests to the correct service based on the AWS API pattern, you only need to set the basic provider configuration:

```hcl
provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}
```

No need to specify individual service endpoints - Floci handles this automatically when pointed at `http://localhost:4566`.

For S3 state storage with Floci (optional):
```hcl
terraform {
  backend "s3" {
    bucket         = "tfstate-floci"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    endpoint       = "http://localhost:4566"
    access_key     = "test"
    secret_key     = "test"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
  }
}
```

## Troubleshooting

### Common Issues
1. **Permission denied on docker socket**: 
   - Linux/macOS: Ensure you're running with `-u root` or have proper permissions to access `/var/run/docker.sock`
   - Windows: Use PowerShell run as Administrator or ensure Docker Desktop has necessary permissions

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