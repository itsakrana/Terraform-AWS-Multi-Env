#!/bin/bash

ENV=$1           # bash scripts/deploy.sh dev OR bash scripts/deploy.sh prod

cd envs/$ENV

terraform destroy -var-file=$ENV.tfvars -auto-approve