variable "namespace" {
  default = "external-dns"
}

variable "domain_filter" {

}

variable "zone_id_filter" {

}

variable "dns_provider" {
  
}

variable "values" {
  type = map
  default = {}
}


variable "ytt_lib_dir" {}

variable "blocker" {
  default = ""
}