# Use variables to customize the deployment

variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = "orgid"
}

variable "root_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default     = "organization id"
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = "centralus"
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
  default     = "eastus2"
}

variable "subscription_id_connectivity" {
  type        = string
  description = "Subscription ID to use for \"connectivity\" resources."
  default     = "e4aad2d8-e670-4807-bf53-63b4a36e0d4a"
}

variable "subscription_id_identity" {
  type        = string
  description = "Subscription ID to use for \"identity\" resources."
  default     = "1d790e78-7852-498d-8087-f5d48686a50e"
}

variable "subscription_id_management" {
  type        = string
  description = "Subscription ID to use for \"management\" resources."
  default     = "019181ad-6356-46c6-b584-444846096085"
}

variable "email_security_contact" {
  type        = string
  description = "Set a custom value for the security contact email address."
  default     = "autocloudarc@autocloudarc.net"
}

variable "log_retention_in_days" {
  type        = number
  description = "Set a custom value for how many days to store logs in the Log Analytics workspace."
  default     = 30
}

variable "enable_ddos_protection" {
  type        = bool
  description = "Controls whether to create a DDoS Network Protection plan and link to hub virtual networks."
  default     = false
}

variable "connectivity_resources_tags" {
  type        = map(string)
  description = "Specify tags to add to \"connectivity\" resources."
  default = {
    deployedBy = "terraform/azure/caf-enterprise-scale/examples/l400-multi"
    demo_type  = "Deploy connectivity resources using multiple module declarations"
  }
}

variable "management_resources_tags" {
  type        = map(string)
  description = "Specify tags to add to \"management\" resources."
  default = {
    deployedBy = "terraform/azure/caf-enterprise-scale/examples/l400-multi"
    demo_type  = "Deploy management resources using multiple module declarations"
  }
}
