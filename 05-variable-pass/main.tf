output "greet-mir" {
  value = "Hello, ${var.string[0]}, your ID is ${var.number[0]}"
}

output "greet-shaukat" {
  value = "Hello, ${var.string[1]}, your ID is ${var.number[1]}"
}

output "greet-achint" {
  value = "Hello, ${var.string[2]}, your ID is ${var.number[2]}"
}

output "was-shaukat-present" {
  value = var.bool
}

output "shaukat-favourite-drink" {
  value = var.map["drink"]
}

output "object" {
  value = var.object
}

output "tuple" {
  value = var.tuple
}