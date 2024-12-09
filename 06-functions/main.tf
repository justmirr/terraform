variable "honey-singh" {
    type = list(string)
    default = [ "Desi Kalakaar", "Vol 1", "High Heels" ]
}

variable "decimal" {
    type = number
    default = 15.1
}

output "upper" {
    value = "First - ${upper(var.honey-singh[0])}"
}

output "lower" {
    value = "Last - ${lower(var.honey-singh[1])}"
}

output "join" {
    value = "All - ${join(", ", var.honey-singh)}"
}

output "floor" {
    value = "Log - ${log(var.decimal, 2)}"
}

output "ceil" {
    value = "Ceil - ${ceil(var.decimal)}"
}