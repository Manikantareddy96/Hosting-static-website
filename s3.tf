resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = "nagahosting"  # Ensure you are targeting the correct existing bucket
  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access settings to manage the visibility of the objects
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Create objects without ACLs since we are using BucketOwnerPreferred
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "index.html"
  source        = "index.html"
  content_type  = "text/html"
}

resource "aws_s3_object" "error" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "error.html"
  source        = "error.html"
  content_type  = "text/html"
}

resource "aws_s3_object" "style" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "style.css"
  source        = "style.css"
  content_type  = "text/css"
}

resource "aws_s3_object" "script" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "script.js"
  source        = "script.js"
  content_type  = "text/javascript"
}

# Configure the S3 bucket to host a static website
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_ownership_controls.example]  # Ensure ownership controls are applied first
}
