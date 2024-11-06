# outputs.tf
output "websiteendpoint" {
  value = aws_s3_bucket.nagahosting.website_endpoint
}

output "public_ip"{
  value = aws_instance.Mani.public_ip
}
