# Azure / Terraform / Azure Pipelines Snippets

## Overview
This repo serves as a quick reference point for orchestrating Azure infrastructure deployment using Terraform and Azure Pipelines.

## Configuration
The repo presents a basic two-layer infrastructure stack:
1) 'Shared' Layer: Used to manage lifecycle of resources that could span multiple logical environments (resource groups, virtual networks, service plans and so on)
2) 'Environmnet' layer(s): Used to manage individual logical environments.

An Azure DevOps pipeline exists for each "layer" in the stack, with parameterised selection of environment and intended Terraform action. There are many ways to implement this orchestration. Assess the tradeoffs and pick what's best for a given scenario. This is one way that has worked well for me (in some scenarios).

Each logical environment in the stack (e.g. dev1, dev2 etc) is defined in code composed via Terraform module(s). This results in repetition (to some degree) but offers optionality to accomodate versioning/variation between environments.


## Local Testing
The `azurerm` backend can be overriden to facilitate testing with local (or remote) tfstate in isolation. This is done with override files:

**Example: environments/australiaeast-dev/shared/backend_override.tf**
AzureRm remote state:
```
terraform {
  backend "azurerm" {
    resource_group_name  = "your-own-rg"
    storage_account_name = "storageaccountname"
    container_name       = "container-for-tfstate"
    key                  = "australiaeast-dev/shared.tfstate"
  }
}
```

We can also use local state:
```
terraform {
  backend "local" {
    path = "./.local.tfstate"
  }
}
```

When testing locally, one should also override the tfvars via commandline or override file:
```
terraform plan -var environment_name="mylocal" -var location="eastus"
```

or in `environments/australiaeast-dev/shared/dev_override.auto.tfvars`:
```
environment_name = "mylocal"
location = "eastus"
```