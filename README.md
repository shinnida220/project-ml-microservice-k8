[![CircleCI](https://dl.circleci.com/status-badge/img/gh/shinnida220/project-ml-microservice-k8/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/shinnida220/project-ml-microservice-k8/tree/main)


# Project Summary
This project is a demonstration of the knowledge gained from the course module - Operationalize a Machine Learning Microservice API. 
It combines knowledge of containerising an application (using Docker), its deployment and how its is being interacted with after deployment using Kubernetes.
The application itself is a prediction app built with Python flask. It exposes an API that serves out predictions (inference) about housing prices through API calls


# Folder & File Description

- app.py: The main flask app serving out predictions via API calls.
- Dockerfile: Dockerfile to create a Docker image for containerization.
- make_prediction.sh: Used to send request to the flask app so as to get a prediction.
- Makefile: Contains instructions that are grouped by functionality.
- readme.md: This file you are viewing.
- requirements.txt: This file contains the application packages to be installed to make the app run properly.
- run_docker.sh: Contains commands to set up docker for running the artifact created from the Dockerfile.
- run_kubernetes.sh: Contains commands to deploy, expose and run the app in kubernetes.
- upload_docker.sh: Contains commands to initiate upload of docker image to docker hub.

# Setup steps

## Setup Python Environment Locally
```
Run `make setup` to setup python env
   python3 -m venv ~/.devops
   source ~/.devops/bin/activate

Run `make install` to install the necessary dependencies
```

## Setup and Configure Kubernetes locally
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl 
 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube
```

## Start Kubernetes 
```
minikube start
```

## Create Flask app in Container
To create the app as a container and run
```
Execute: ./run_docker.sh
```

This does the build image and run as docker:

- Build image and add a descriptive tag
```
docker build --tag=tj-app  .
```

- Run flask app
```
docker run -p 8000:80  tj-app
```

## Upload the container image to Docker Hub
```
./upload_docker.sh 
```

This tags and pushes the app's docker image to Docker Hub
- Push image to a docker repository
```
docker push $dockerpath
```

## Run via kubectl
```
./run_kubernetes.sh
```

This does the build image and run as docker:

- Run the Docker Hub container with kubernetes
```
kubectl run tj-app --image=tjoseph2020/tj-app --port=80
```

- Waits for kubernetes pods to be ready
```
kubectl wait --for=condition=ready pods/tj-app
```

- Forwards the container port to a host
```
kubectl port-forward tj-app 8000:80
```


# Running Locally
Ensure you have python installed on your machine. Then run the following commands

```
make setup
make install
python3 app.py
```
Then run ./make_prediction in a second terminal window.

# Running Via Docker
Ensure you have docker installed on your machine. Then run the following command

```
./run_docker
```
Then run ./make_prediction in a second terminal window.

# Running Via Kubernetes
Ensure you have docker installed on your machine. Then run the following command

```
./run_kubernetes
```
Then run ./make_prediction in a second terminal window.
