resource "scaleway_registry_namespace" "breakathon-xebia4ever" {
  name        = "breakathon-xebia4ever"
  description = "Container Registry ${local.desc_purpose}"
  is_public   = false
}
