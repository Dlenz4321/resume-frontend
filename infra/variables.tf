variable "resource_group_name" {
  description = "Resource group created by bootstrap.sh"
  type        = string
  default     = "rg-resume-prod"
}

variable "github_principal_id" {
  description = "Object (principal) ID of the id-github-resume managed identity"
  type        = string
}

variable "tags" {
  description = "Tags applied to every resource"
  type        = map(string)
  default = {
    project    = "cloud-resume"
    managed_by = "terraform"
  }
}