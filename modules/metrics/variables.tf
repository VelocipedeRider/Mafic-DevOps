variable "namespace" {
    type = string
    default = "mon"
    description = "name of the deployment namespace"
}

variable "kubernetes_manifest_manifest_metadata_label_app" {
    type = string
    default = "state-metrics"
    description = "The manifest metadata label called app and it's value"
}

variable "kubernetes_manifest_manifest_metadata_name" {
    type = string
    default = "state-metrics"
    description = "The manifest metadata value called name and it's value"
}
