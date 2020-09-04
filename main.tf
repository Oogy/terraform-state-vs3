terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "1.4.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "2.7.0"
    }
  }
}

provider "vultr" {
}

provider "aws" {
  region = "us-east-1"
  access_key = data.vultr_object_storage.unit.s3_access_key
  secret_key = data.vultr_object_storage.unit.s3_secret_key
  skip_credentials_validation = true
  skip_requesting_account_id = true

  endpoints {
    s3 = "ewr1.vultrobjects.com"
  }
}
