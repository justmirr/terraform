variable "map" {
  type = map(string)
  default = {
    "Name" = "Mozin"
    "Age" = "22"
    "Interest" = "Development"
  }
}

variable "dynamic" {
    type = string
}

output "details" {
    value = "Name: ${lookup(var.map, "Name")}, Age: ${lookup(var.map, "Age")}, and Interest: ${lookup(var.map, "${var.dynamic}")}"
}