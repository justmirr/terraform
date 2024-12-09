resource "oci_load_balancer" "theloadbalancer" {
  compartment_id = var.compartment_id
  subnet_ids = [ "${var.subnet_id}" ]
  display_name = "happy-load-balancer"
  shape = "100Mbps"
  is_private = "false"
  ip_mode = "IPV4"
  
}

resource "oci_load_balancer_backend_set" "theloadbalancerbackendset" {
  health_checker {
    interval_ms = "10000"
    port = "80"
    protocol = "HTTP"
    response_body_regex = ""
    retries = "3"
    return_code = "403"
    timeout_in_millis = "3000"
    url_path = "/"
  }
  load_balancer_id = oci_load_balancer.theloadbalancer.id
  name = "happy-set"
  policy = "LEAST_CONNECTIONS"
}

resource "oci_load_balancer_backend" "theloadbalancerbackend" {
  backendset_name = oci_load_balancer_backend_set.theloadbalancerbackendset.name
  backup = "false"
  drain = "false"
  port = "80"
  load_balancer_id = oci_load_balancer.theloadbalancer.id
  ip_address = "10.0.0.155"
  weight = "1"
}

resource "oci_load_balancer_listener" "theloadbalancerlistener" {
  connection_configuration {
    backend_tcp_proxy_protocol_version = "0"
    idle_timeout_in_seconds = "60"
  }
  name = "happy-listener"
  port = "80"
  protocol = "HTTP"
  load_balancer_id = oci_load_balancer.theloadbalancer.id
  default_backend_set_name = oci_load_balancer_backend_set.theloadbalancerbackendset.name
}