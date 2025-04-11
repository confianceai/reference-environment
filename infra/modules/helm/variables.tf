variable "name" {
  type        = string
  description = "Name of the Helm Release."
}

variable "repository" {
  type        = string
  description = "Chart repository."
}

variable "chart" {
  type        = string
  description = "Name of the Helm chart."
}

variable "namespace" {
  type        = string
  description = "Namespace in which the Release should be deployed."
}

variable "chart_version" {
  type        = string
  description = "Version of the Helm chart."
}

variable "values_file" {
  type        = string
  description = "Path of the values file."
}

variable "values_variables" {
  description = "Set of values to be injected in the values file as a template."
  default     = {}
}

variable "set_values" {
  type        = list(object({ name = string, value = string }))
  default     = []
  description = "List of values to set. Takes precedency to values files."
  nullable    = true
}

variable "set_list_values" {
  type        = list(object({ name = string, value = list(string) }))
  default     = []
  description = "List of values of type list to set."
  nullable    = true
}

variable "registry_server" {
  type        = string
  description = "Container registry host."
}

variable "registry_username" {
  type        = string
  description = "Container registry username."
}

variable "registry_password" {
  type        = string
  description = "Container registry password."
}
