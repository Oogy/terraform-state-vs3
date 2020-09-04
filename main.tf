terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "1.4.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "3.5.0"
    }
  }
}

provider "vultr" {
}

resource "vultr_object_storage" "unit" {
  # Need to hardcode 2, this is actually referring to NJ DCID=1, some issue with the object keys
  object_storage_cluster_id = 2
  label = var.storage_unit_label
}

provider "aws" {
  region = "us-east-1"
  access_key = vultr_object_storage.unit.s3_access_key
  secret_key = vultr_object_storage.unit.s3_secret_key
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_get_ec2_platforms = true
  skip_metadata_api_check = true

  endpoints {
    s3 = "ewr1.vultrobjects.com"
  }
}

resource "aws_s3_bucket" "project_state" {
  bucket = "${uuid()}-${var.storage_unit_label}"
  acl   = "private"

  lifecycle_rule {
    enabled = false
  }
}
