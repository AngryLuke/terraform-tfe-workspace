terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.44.1"
    }
  }
  required_version = "~> 1.4.6"
}

provider "tfe" {
}

locals {
    # list with projects name to fetch projects id
    projects_name_list = [ for r in var.workspaces : r.project]
} 

data "tfe_project" "project_ids" {
    for_each = toset([ for r in var.workspaces : r.project])
    name = each.key
    organization = var.org_name
}

resource "tfe_workspace" "new" {
  organization   = var.org_name
  for_each       = { for o in var.workspaces : o.name => o }
  name           = each.key
  project_id     = lookup(data.tfe_project.project_ids, each.value.project, "").id
  execution_mode = each.value.exec_mode
  auto_apply     = each.value.auto_apply
}
