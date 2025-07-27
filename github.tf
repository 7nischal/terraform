terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = "Provide your GitHub token here"
  owner = "7nischal"
}

resource "github_repository" "example" {
  name        = "terraform"
  description = "Automated the deployment of an EC2 instance & Creation of GithubRepo using Terraform"

  visibility = "public"


}