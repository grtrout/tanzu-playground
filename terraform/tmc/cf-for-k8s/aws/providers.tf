provider "aws" {
  region = var.region
}

provider "tmc" {
  api_key = var.tmc_key
}

provider "kubernetes" {
  host                   = data.tmc_kubeconfig.kubeconfig.server

  client_certificate     = base64decode(data.tmc_kubeconfig.kubeconfig.client_certificate)
  client_key             = base64decode(data.tmc_kubeconfig.kubeconfig.client_key)
  cluster_ca_certificate = base64decode(data.tmc_kubeconfig.kubeconfig.cluster_ca_certificate)

  load_config_file       = false
}

provider "k14s" {
  kapp {
    kubeconfig_yaml = data.tmc_kubeconfig.kubeconfig.content
  }
}

locals {
  ytt_lib_dir = "${path.module}/../../../../ytt-libs"
}