variable "org_name" {
  description = "Name of Terraform Cloud organization where create project"
}

variable "workspaces" {
  description = "List of workspace object names you want to create {name = \"workspace name\", project= \"project name\", exec_mode = \"allowed remote modes\", auto_apply = \"true or false\"}"
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