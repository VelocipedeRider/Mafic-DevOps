locals {                                                            #values for the metrics module. Check ./modules/metrics/variables.tf for more options
  namespace                                       = "mon"           #default is "mon"
  kubernetes_manifest_manifest_metadata_name      = "state-metrics" #default is "state-metrics"
  kubernetes_manifest_manifest_metadata_label_app = "state-metrics" #default is "state-metrics"
}

module "metrics" {
  source                                          = "./modules/metrics"
  namespace                                       = local.namespace
  kubernetes_manifest_manifest_metadata_name      = local.kubernetes_manifest_manifest_metadata_name
  kubernetes_manifest_manifest_metadata_label_app = local.kubernetes_manifest_manifest_metadata_label_app
}
