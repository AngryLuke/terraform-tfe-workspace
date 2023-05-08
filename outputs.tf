output "project_ids" {
  description = "List of all project IDs fetched"
  value = {
    for k, v in data.tfe_project.project_ids : k => v.id
  }
}

output "workspace_ids" {
  description = "List of all workspace IDs created"
  value = {
    for k, v in tfe_workspace.new : k => v.id
  }
}