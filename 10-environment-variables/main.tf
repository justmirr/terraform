# $env:TF_VAR_username="Mir"
# $env:TF_VAR_pin="123" 

variable "username" {
    type = string
}

variable "pin" {
    type = number
}

output "credentials" {
    value = "Username Provided: ${var.username}. Pin Provided: ${var.pin}"
}


