#!/bin/bash

# Set the subscription
export ARM_SUBSCRIPTION_ID="b17f2e5c-4f07-47bc-8615-a07aa6f75004"

# Set the application / environment
export TF_VAR_application_name="aztf"
export TF_VAR_environment_name="dev"

#set the backend
export BACKEND_RESOURCE_GROUP="rg-terraform-state-dev"
export BACKEND_STORAGE_ACCOUNT="sti1urt1qqt1"
export BACKEND_CONTAINER_NAME="tfstate"
export BACKEND_KEY=$TF_VAR_application_name-$TF_VAR_environment_name

# Run terraform
terraform init -reconfigure \
-backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
-backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
-backend-config="container_name=${BACKEND_CONTAINER_NAME}" \
-backend-config="key=${BACKEND_KEY}"
terraform "$@"