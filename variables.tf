variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Resource Group Name"
  default     = "West Europe"
}

variable "containers" {
  type        = list(any)
  description = "Containers that must be created within the storage account"
}

variable "datalake" {
  type        = bool
  description = "Enable Azure Datalake Gen2"
  default     = true
}