terraform {
  required_providers {
    cml2 = {
      source  = "registry.terraform.io/ciscodevnet/cml2"
    }
  }
} 

provider "cml2" {
  address     = var.address
  username    = var.username
  password    = var.password
  skip_verify = true
} 

variable "address" {
  description = "CML controller address"
  type        = string
  default     = "https://cml-controller.home.arpa"
}

variable "username" {
  description = "cml2 username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "cml2 password"
  type        = string
  sensitive   = true
}


resource "cml2_lifecycle" "this" {
  topology = file("stp_lab.yaml")
} 