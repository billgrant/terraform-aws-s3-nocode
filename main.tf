terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.6.0"
        }
    }
}

resource "aws_s3_bucket" "simple" {
    region = var.aws_region
}

resource "aws_s3_bucket_server_side_encryption_configuration" "simple" {
  bucket = aws_s3_bucket.simple.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}