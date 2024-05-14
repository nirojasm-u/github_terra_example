terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "" //Insert your GitHub token here
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

  template {
    owner                = "nirojasm-u"
    repository           = "astro-example"
    include_all_branches = true
  }
}

resource "github_repository" "example_pages" {
  name        = "example_pages"
  description = "My awesome web page"

  visibility = "public"

  template {
    owner                = "nirojasm-u"
    repository           = "pages-template"
    include_all_branches = true
  }

  pages {
    source {
      branch = "main"
      path   = "/docs"
    }
  }
}

resource "github_branch" "development" {
  repository = "example"
  source_branch = "master"
  branch     = "development"
}

resource "github_branch" "feature" {
  repository = "example"
  source_branch = "master"
  branch     = "feature"
}

resource "github_branch" "testing" {
  repository = "example"
  source_branch = "master"
  branch     = "testing"
}