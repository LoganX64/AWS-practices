Project 1 — AWS S3 File Storage CLI Lab

1. Create project

```
cd D:\practise
mkdir AWS-practices
cd AWS-practices

mkdir files
mkdir downloads
mkdir commands
mkdir notes
```

2. Configure

```
$env:AWS_ENDPOINT_URL="http://localhost:4566"
$env:AWS_ACCESS_KEY_ID="test"
$env:AWS_SECRET_ACCESS_KEY="test"
$env:AWS_DEFAULT_REGION="us-east-1"
```

3. Create bucket

```
aws s3 mb s3://my-first-aws-lab
```

4. Verify bucket

```
aws s3 ls
```

```
aws s3api head-bucket --bucket my-first-aws-lab
```

5. Create files

```
"Hello from AWS S3!" | Out-File .\files\hello.txt
```

```
"File uploaded to the uploads prefix." | Out-File .\files\upload.txt
```

```
"Monthly report from AWS S3 lab." | Out-File .\files\report.txt
```

6. Upload files

```
aws s3 cp .\files\hello.txt s3://my-first-aws-lab/hello.txt
```

```
aws s3 cp .\files\upload.txt s3://my-first-aws-lab/uploads/upload.txt
```

```
aws s3 cp .\files\report.txt s3://my-first-aws-lab/reports/report.txt
```

7. List files

```
aws s3 ls s3://my-first-aws-lab/
```

```
aws s3 ls s3://my-first-aws-lab/ --recursive
```

8. Download file

```
aws s3 cp s3://my-first-aws-lab/hello.txt .\downloads\hello-downloaded.txt
```

```
Get-Content .\downloads\hello-downloaded.txt
```

9. Inspect bucket

```
aws s3api get-bucket-location --bucket my-first-aws-lab
```

```
aws s3api head-bucket --bucket my-first-aws-lab
```

```
aws s3api list-objects-v2 --bucket my-first-aws-lab
```

10. Inspect object

```
aws s3api head-object --bucket my-first-aws-lab --key hello.txt
```

11. ARN
    `arn:aws:s3:::my-first-aws-lab`
    `arn:aws:s3:::my-first-aws-lab/hello.txt`
    `arn:aws:s3:::my-first-aws-lab/*`

12. Delete objects

```
aws s3 rm s3://my-first-aws-lab/hello.txt
```

```
aws s3 rm s3://my-first-aws-lab/uploads/upload.txt
```

```
aws s3 rm s3://my-first-aws-lab/reports/report.txt
```

13. Verify empty bucket

```
aws s3api list-objects-v2 --bucket my-first-aws-lab
```

14. Delete bucket

```
aws s3 rb s3://my-first-aws-lab
```

15. Verify deletion

```
aws s3 ls
```
