#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=sanctitygeorge/python-devops-img:1.1
echo "Docker ID and Image: $dockerpath"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run python-devops-img  --image=$dockerpath --port=80
# kubectl create deployment python-devops-minikube --image=sanctitygeorge/python-devops-img:1.1

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
# kubectl expose deployment python-devops-minikube --type=NodePort --port=80
kubectl port-forward python-devops-img 8000:80
