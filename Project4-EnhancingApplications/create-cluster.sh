#!/bin/bash

# Variables
# Cloud Lab users should use the existing Resource group name, such as, resourceGroup="cloud-demo-153430" 
resourceGroup="cloud-demo-155111"
clusterName="audreystaks"
APPREG="audreystacr"

# Install aks cli
# echo "Installing AKS CLI"

# az aks install-cli

# echo "AKS CLI installed"

# Create AKS cluster
echo "Step 1 - Creating AKS cluster $clusterName"
# Use either one of the "az aks create" commands below
# For users working in their personal Azure account
# This commmand will not work for the Cloud Lab users, because you are not allowed to create Log Analytics workspace for monitoring
# az aks create \
# --resource-group $resourceGroup \
# --name $clusterName \
# --node-count 1 \
# --enable-addons monitoring \
# --generate-ssh-keys

# For Cloud Lab users
az aks create \
--resource-group $resourceGroup \
--name $clusterName \
--node-count 1 \
--attach-acr $APPREG \
--generate-ssh-keys

# For Cloud Lab users
# This command will is a substitute for "--enable-addons monitoring" option in the "az aks create"
# Use the log analytics workspace - Resource ID
# For Cloud Lab users, go to the existing Log Analytics workspace --> Properties --> Resource ID. Copy it and use in the command below.
az aks enable-addons -a monitoring -n $clusterName -g $resourceGroup --workspace-resource-id "/subscriptions/6311e2c3-cf5c-4b30-9d8b-cd5b7219a8a5/resourcegroups/cloud-demo-155111/providers/microsoft.operationalinsights/workspaces/loganalytics-155111"

echo "AKS cluster created: $clusterName"

# Connect to AKS cluster

echo "Step 2 - Getting AKS credentials"

az aks get-credentials \
--resource-group $resourceGroup \
--name $clusterName \
--verbose

echo "Verifying connection to $clusterName"

kubectl get nodes


# echo "Deploying to AKS cluster"
# The command below will deploy a standard application to your AKS cluster. 
# make sure image is already deploy to ACR before carry out AKS deployment
# kubectl apply -f azure-vote-all-in-one-redis