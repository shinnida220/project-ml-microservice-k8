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
Ensure you have docker installed on your machine. 
Start minikube
`minikube start --force --memory=1500mb`
I used --memory=1500 because the app was run on a machine with 2gig memory
Then run the following command

```
./run_kubernetes
```
Then run ./make_prediction in a second terminal window.
