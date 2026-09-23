terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
        }
    }
}

provider "aws"{
    region = "us-south-1"
    access_key ="test"
    secret_key="test"
    skip_credentials_validation=true
    skip_requesting_account_id=true
    skip_metadata_api_check= true
    endpoints{
        s3= "http://localhost:4566"
    }
}

resource "aws_s3_bucket" "lab"{
    bucket="terraform-exercise-01"
}