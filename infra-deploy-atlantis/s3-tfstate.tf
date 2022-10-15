####################################################
# S3 Bucket tfstate
####################################################

resource "aws_s3_bucket" "tf_state" {
  bucket = "infrati-tfstate-bucket"
  force_destroy = true

  tags = {
    Name        = "terraform-state"
    Environment = "Development"
  }
}

####################################################
# S3 Bucket ACL
####################################################

resource "aws_s3_bucket_acl" "bucket_acl_tfstate" {
  bucket = aws_s3_bucket.tf_state.id
  acl    = "private"
}

####################################################
# Define Bucket Encryption
####################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

####################################################
# Enable S3 Bucket Versioning
####################################################

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
