terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

locals {
  stages = ["dev", "intg"]
}

module "api_gateway" {
  for_each = toset(local.stages)
  source = "./get_rest_api"
  stage = each.value
}

output "api_names" {
  value = [for api in module.api_gateway : api.api_gateway_invoke_url]
}

