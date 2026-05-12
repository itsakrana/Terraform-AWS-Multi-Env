#!/bin/bash

ENV=$1

cd envs/$ENV

terraform init
terraform plan -var-file=$ENV.tfvars
terraform apply -var-file=$ENV.tfvars -auto-approve