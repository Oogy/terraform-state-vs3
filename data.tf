data "vultr_region" "region" {
  filter {
    name   = "name"
    values = [var.region]
  }
}

