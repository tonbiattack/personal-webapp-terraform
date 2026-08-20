provider "github" {}

resource "github_repository" "application" {
  name                   = var.repository_name
  description            = "個人開発向けの Web アプリ基盤"
  visibility             = var.visibility
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  delete_branch_on_merge = true

  topics = ["terraform", "webapp", "serverless", "personal-development"]
}

resource "github_repository_vulnerability_alerts" "application" {
  repository = github_repository.application.name
  enabled    = true
}

resource "github_repository_ruleset" "main" {
  name        = "main の基本ルール"
  repository  = github_repository.application.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion         = true
    non_fast_forward = true
  }
}
