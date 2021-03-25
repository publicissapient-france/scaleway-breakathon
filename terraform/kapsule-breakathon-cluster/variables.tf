variable "challenge" {
  type        = string
  description = "The challenge for which the cluster will be used"
}

variable "challenge_slug" {
  type        = string
  description = "The challenge for which the cluster will be used - short version that can be used in resources IDs"
}

variable "common_tags" {
  type    = list(string)
  default = []
}
