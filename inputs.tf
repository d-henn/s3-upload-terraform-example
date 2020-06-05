variable "upload_artifacts" {
  type        = string
  default     = "build" # sample ReactJS build folder
  description = "Artifact/Directory/File to be uploaded relative to the Terraform directory (i.e ../build, ../dist, index.html, etc...)"
}

locals {
  mime_types = jsondecode(file("${path.module}/data/mime.json"))
}
