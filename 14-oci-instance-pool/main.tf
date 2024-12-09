# resource "oci_core_instance_configuration" "theinstanceconfiguration" {
#   compartment_id = var.compartment_id
#   display_name = "sad-configuration"
#   instance_details {
#     instance_type = "compute"
#     launch_details {
#         compartment_id = var.compartment_id
#         shape = var.instance_shape
#         shape_config {
#           ocpus = 4
#           memory_in_gbs = 4
#         }
#         source_details {
#           source_type = "image"
#           image_id = var.image_id
#         }
#         create_vnic_details {
#           subnet_id = var.subnet_id
#           assign_public_ip = true
#         }
#         metadata = {
#           ssh_authorized_keys = file(var.public_path)
#         }
#         availability_domain = var.availaibilty_id
#     }
#   }
#   source = "NONE"
# }

# resource "oci_core_instance_pool" "theinstancepool" {
#     display_name = "sad-pool"
#     compartment_id = var.compartment_id
#     instance_configuration_id = oci_core_instance_configuration.theinstanceconfiguration.id
#     placement_configurations {
#         availability_domain = var.availaibilty_id
#         primary_subnet_id = var.subnet_id
#     }
#     size = "1"
# }

resource "oci_autoscaling_auto_scaling_configuration" "theautoscaling" {
  auto_scaling_resources {
    id = oci_core_instance_pool.theinstancepool.id
    type = "instancePool"
  }
  compartment_id = var.compartment_id
  cool_down_in_seconds = "300"
  display_name = "sad-autoscaling"
  is_enabled = true
  policies {
    capacity {
      initial = "1"
      max = "3"
      min = "1"
    }
    display_name = "sad-rules"
    policy_type = "threshold"
    rules {
      action {
        type = "CHANGE_COUNT_BY"
        value = "1"
      }
      display_name = "sad-scale-out"
      metric {
        metric_type = "CPU_UTILIZATION"
        threshold {
          operator = "GT"
          value = "70"
        }
      }
    }
    rules {
        action {
          type = "CHANGE_COUNT_BY"
          value = "-1"
        }
        display_name = "sad-scale-in"
        metric {
          metric_type = "CPU_UTILIZATION"
          threshold {
            operator = "LT"
            value = "30"
          }
        }
    }
  }
}