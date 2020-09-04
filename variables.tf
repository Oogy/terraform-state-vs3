variable "region" {
  type = string
  default = "New Jersey"
}

variable "bucket_name" {
  type = string
  default = "astra"
}

variable "bucket_acl" {
  type = string
  default = "private"
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}
