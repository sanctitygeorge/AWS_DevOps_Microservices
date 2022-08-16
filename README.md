
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sanctitygeorge/DevOps-Microservices-Containers/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sanctitygeorge/DevOps-Microservices-Containers/tree/master)

## Project Overview

This project is aimed to containerize and deploye a machine learning application using Python, Docker, Kubernetes and CI/CD Pipeline (CircleCI)

In this project, I used a pre-trained `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). The main aim of this project is to operationalize a Python flask app—in a deployment file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Objectives

The following are the objectives in this project:
* Install the necesary python libraries
* Test the project code using linting
* Complete a Dockerfile to containerize this application
* Deploy the containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that the code has been tested


---

## Setup the Environment

* Clone the project repository
* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Run the Standalone:  `python app.py`
2. Dockerize project and make predictions:  `./run_docker.sh`
3. Deploy containerized application to DockerHub (if it fails run with sudo):  `./upload_docker.sh `
4. Create a Kubernetes cluster and deploy a container using Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally. You'll need to install Docker, Minikube and/or VirtialBox to run K8s locally. The following commands spin up a Kubernetes cluster and configure it to run the Docker image you've built

    - minikube start
    - kubectl get pod

* Create Flask app in Docker Container as below: 
    `docker run -p 8080:80 <Docker ID>/<image name>:tag`

* Run via kubectl
    - `kubectl run machine-learning-api --image=$dockerpath --port=80`
    - `kubectl port-forward <name> 8080:80`

### Folder and File Structures
* app.py: our flask application file
* test_app.py: file that exercise edge cases in code blocks
* Makefile: make utility file which defines set of tasks to be executed
* Dockerfile: file with instructions to build Docker images
* .hadolint.yaml: supports hadolint configurations like the ingnoring rules.
* .dockerignore: prevents files or folders from being listed in the build context
* requirements.txt: file with listed project dependecies
* docker_out.txt and kubernetes_out.txt:
    * These are output files with given provided exercise logs
* make_predictions.sh, run_docker.sh, run_kubernetes.sh, setup_installations.sh, upload_docker.sh:
    * These are script files with a sequence of commands run to perform a given task.
