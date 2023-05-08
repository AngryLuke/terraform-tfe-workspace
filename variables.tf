variable "org_name" {
  description = "Name of Terraform Cloud organization where create project"
}

variable "workspaces" {
  description = "List of project names you want to create"
  type = list(
    object(
      {
        name       = string
        project    = string
        exec_mode  = string
        auto_apply = bool
      }
    )
  )
}