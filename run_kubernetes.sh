#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="nuelibk/python-prediction"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run prediction-app --image=$dockerpath --port=80
kubectl create deploy python-prediction --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl wait --for=condition=ready pods/prediction-app
kubectl get po -A

# Step 4:
# Forward the container port to a host
kubectl port-forward prediction-app --address 0.0.0.0 8000:80

