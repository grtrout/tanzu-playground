module "infrastructure" {
  source = "../../modules/infrastructure/gcp"

  project          = var.project
  environment_name = var.environment_name
  region           = var.region
  dns_zone_name    = module.dns.zone_name
  acme_email       = var.acme_email
  ytt_lib_dir      = local.ytt_lib_dir
  domain           = module.dns.base_domain

  blocker = null_resource.cluster_blocker.id
}