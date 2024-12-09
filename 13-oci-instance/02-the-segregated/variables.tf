# Provider Variables

variable "tenancy_id" { type=string }
variable "user_id" { type=string }
variable "private_path" { type=string }
variable "fingerprint" { type=string }
variable "region_id" { type=string }


# Resource Variables

variable "parent_compartment" { type = string }
variable "instance_shape" { type = string }
variable "image_id" { type = string }
variable "public_path" { type = string }