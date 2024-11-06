resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = "nagahosting"  # Ensure you are targeting the correct existing bucket
  versioning_configuration {
    status = "Enabled"
  }
}
