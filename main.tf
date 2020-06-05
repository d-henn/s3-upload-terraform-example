provider "aws" { ... }

resource "aws_s3_bucket_object" "s3_upload" {
  for_each = fileset("${path.root}/${var.upload_artifacts}", "**/*")

  bucket = "your-bucket" # your actual bucket
  key    = each.value
  source = "${path.root}/${var.upload_artifacts}/${each.value}"

  etag         = filemd5("${path.root}/${var.upload_artifacts}/${each.value}")
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), null) # if none found default to null (will result in binary/octet-stream)
}
