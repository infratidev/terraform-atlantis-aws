variable "region" {
  description = "The regions in AWS that resources will be created"
  type        = string
}

variable "domain" {
  description = "The domain set in route53"
  type        = string
}

variable "github_token" {
  description = "Github token"
  type        = string
}

variable "github_user" {
  description = "Github user for Atlantis to utilize when performing Github activities"
  type        = string
}

variable "github_owner" {
  description = "Github Owner"
  type        = string
}

variable "trusted_principals" {
  description = "A list of principals, in addition to ecs-tasks.amazonaws.com, that can assume the task role"
  type        = list(string)
}

variable "atlantis_repo_allowlist" {
  description = "Allowed repo list"
  type        = list(string)
}

variable "atlantis_repo_names" {
  description = "List of Github repositories that should be monitored by Atlantis"
  type        = list(string)
}

variable "env" {
  description = "Ambiente"
  default     = "Development"
}
