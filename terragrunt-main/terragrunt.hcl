
# Reference lacal values form the environment.hcl 
locals {
    environment_vars     = read_terragrunt_config("${path_relative_from_include()}/environment.hcl")
    region = local.environment_vars.locals.region
    profile_name = local.environment_vars.locals.profile_name
    client_name = local.environment_vars.locals.client_name
    env = local.environment_vars.locals.env
    account_id = local.environment_vars.locals.account_id
    provisioner = local.environment_vars.locals.provisioner
}

# Generate provider in each folder of terragrunt 
generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
    provider "aws" {
    region = "${local.region}"
    profile = "${local.profile_name}"
    }
    
    EOF
}

remote_state {
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    backend = "s3"
    config = {
        encrypt = true
        bucket = "${local.client_name}-${local.env}-${local.account_id}-terragrunt"
        key = "terraform.tfstate" 
        region = local.region
        dynamodb_table = "${local.client_name}-${local.env}-${local.account_id}-terragrunt"
        profile = local.profile_name
    }

}

# Global Parameters

inputs = local.environment_vars.locals