provider "github" {
  owner = "pbkn"
}

resource "github_repository" "terraform-github-template" {
  name        = "terraform-github-template"
  description = "template repository create by terraform"
  visibility = "public"
}

resource "github_branch_protection" "terraform-github-template-main" {
  repository_id = github_repository.terraform-github-template.node_id
  pattern          = "main"
  enforce_admins   = true
  allows_deletions = false
}