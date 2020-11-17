## Traackr DevOps Technical Project

This is my solution to the challenge provided by Traackr.

## Pre-Requisites
In order to use this solution, you will have to have the following pre-requisites installed and working on your machine:
* docker
* kubectl
* minikube
* helm

## What did I do to get the final version
This is a list of challenges I've faced as part of solving this challenge:

### Docker App
I've to create an minimalistic image that hosts my static website. Dockerfile included in this repository.

#### Step by Step
* Login into docker hub
* build my image localy
* tag my image
* push my image to my public repository

```bash
docker login --username=pazmariano
docker build -t hello:v0.1.0 .
docker tag <local_image_id> pazmariano/traackr:v0.1.0
docker push
```

### Helm Chart

Since this was my first time using Kubernetes and Helm, I had to 1st get familiar with the technology.
Here is a list of documentation I've used to understand how the solution works:

* Kubernetes
[Minikube](https://minikube.sigs.k8s.io/docs/start/)
* Helm
[Helm](https://helm.sh/docs/intro/quickstart/)
* Traefik
[Traefik](https://doc.traefik.io/traefik/v1.3/user-guide/kubernetes/)

Since I never used either Traefik or any other Ingress Controller, I've started by building all manually using the mentioned article. Then switched to official Helm Chart that runs latest version.
On my 1st iteration of the excersice, I've used traefik configured using Deployment instead of DaemonSet. That delayed me due to the fact that the port used to test the application is dynamic and wasn't obvious to me how to do it.
Here is the article I've used on my 1st try. [Read more] (https://doc.traefik.io/traefik/v1.7/user-guide/kubernetes/)

#### 1st try step by step
* Create my own local collection of files for traefik including RBAC, Deployment, Service and Ingress
* Create my own local helm chart for hello world app including Deployment, Service and Ingress
* Create a standard helm chart using helm commands [Article used](https://medium.com/google-cloud/kubernetes-and-helm-create-your-own-helm-chart-5f54aed894c2)
* Learn how to declare dependencies to existing charts

#### Step by Step
* start minikube cluster
* Install my helm chart with his dependencies
* Accomodate the environment for testing the app
* Test the app using curl or web browser

```bash
minikube start
helm install --dependency-update hello-test01 hello/
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=hello,app.kubernetes.io/instance=hello-test-01" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT &&
curl 127.0.0.1:8080
```

#### Using startup script
This repository includes an startup.sh script that does the start and install of the helm but it doesn't export the required variables.
You can run the script that will start minikube cluster and install the helm chart. Follow the instructions printed at the end in order to make the app work as needed.
