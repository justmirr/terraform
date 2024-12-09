variable "string" {
    type = list(string)
    default = ["mir","shaukat", "achint"]
}

variable "number" {
    type = list(number)
    default = [111, 152, 000]
}

variable "bool" {
    type = bool
    default = true
}

variable "map" {
    type = map(string)
    default = {
        "food" = "pizza",
        "drink" = "mojito"
    }
}

variable "object" {
    type = object({
      instance_type = string
      volume_size = number
      tags = map(string)
    })
    default = {
      instance_type = "t2.micro"
      volume_size = 20
      tags = {
        Name = "object-instance"
        Env = "dev"
      }
    }
}

variable "tuple" {
    type = tuple([number, string, bool])
    default = [111, "Mir", true]
}