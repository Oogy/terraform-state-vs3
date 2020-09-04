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

resource "vultr_object_storage" "unit" {
  object_storage_cluster_id = data.vultr_region.region.id
  label = var.storage_unit_label
}
