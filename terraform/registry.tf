resource "scaleway_registry_namespace" "xebia4ever-breakathon" {
  name        = "xebia4ever-breakathon"
  description = "Container Registry ${local.desc_purpose}"
  is_public   = false
}
