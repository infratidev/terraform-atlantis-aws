##############################################################
# Atlantis Service
##############################################################

module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = "3.22.0"

  name = "atlantis"

################################################################################
# VPC
################################################################################

  cidr            = "10.50.0.0/16"
  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.50.100.0/24", "10.50.101.0/24", "10.50.102.0/24"]
  public_subnets  = ["10.50.200.0/24", "10.50.201.0/24", "10.50.202.0/24"]

################################################################################
# DNS
################################################################################

  route53_zone_name = var.domain

################################################################################
# Atlantis 
################################################################################

  atlantis_github_user        = var.github_user
  atlantis_github_user_token  = var.github_token
  atlantis_repo_allowlist    = [for repo in var.atlantis_repo_names : "github.com/${var.github_owner}/${repo}"]

  allow_unauthenticated_access = true
  allow_github_webhooks        = true

################################################################################
# IAM
################################################################################

  policies_arn = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  ]

}

################################################################################
# GitHub Webhooks
################################################################################

module "github_repository_webhook" {
  source  = "terraform-aws-modules/atlantis/aws//modules/github-repository-webhook"
  version = "3.21.0"
  
  github_owner        = var.github_owner
  github_token        = var.github_token

  atlantis_repo_allowlist = var.atlantis_repo_names

  webhook_url    = module.atlantis.atlantis_url_events
  webhook_secret = module.atlantis.webhook_secret
}