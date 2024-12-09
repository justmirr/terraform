variable "file" {
    type = string
}

output "tfvars" {
    value = "Using ${var.file} file"
}

output "variable" {
    value = "Through ${var.varfile} file"
}