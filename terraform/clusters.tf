module "software-kapsule-cluster" {
  source = "./kapsule-breakathon-cluster"
  challenge = "Software"
  challenge_slug = "software"
  common_tags = local.common_tags
}

module "ops-kapsule-cluster" {
  source = "./kapsule-breakathon-cluster"
  challenge = "Security and Architecture"
  challenge_slug = "ops"
  common_tags = local.common_tags
}

module "open-kapsule-cluster" {
  source = "./kapsule-breakathon-cluster"
  challenge = "Open Category"
  challenge_slug = "free"
  common_tags = local.common_tags
}

module "ai-kapsule-cluster" {
  source = "./kapsule-breakathon-cluster"
  challenge = "Artificial Intelligence"
  challenge_slug = "ai"
  common_tags = local.common_tags
}

module "fun-kapsule-cluster" {
  source = "./kapsule-breakathon-cluster"
  challenge = "Fun and Games"
  challenge_slug = "fun"
  common_tags = local.common_tags
}
