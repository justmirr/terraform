# Use terraform plan -var-file=filename for custom variable files

variable "file"{
    type = string
}

output "custom" {
  value = "Using a ${var.file} file"
}