resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = "manihosting"  # Ensure you are targeting the correct existing bucket
  versioning_configuration {
    status = "Enabled"
  }
}
