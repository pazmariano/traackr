# FlaskHello

FlaskHello is a containerized Flask webapp that only prints "Hello World!" message.
The porpuse of this repo is to demostrate how to use Docker and Kubernetes to run a Python web application based on Flask framework.

## Pre-Requisites

This repository contains files that will allow you to run this WebApp in your own K8S cluster, locally.
In order to do it, you will have to have the following dependencies installed:
* Docker -> Used to build, run and share your containers. [Read More](https://docs.docker.com/get-docker/)
* minikube -> Used run your local Kubernetes service. [Read More](https://minikube.sigs.k8s.io/docs/start/)
* kubectl -> Used administer your local Kubernetes service. [Read More](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## HOW TOs
* [Build Image](build.md)
* [Run the App](k8s.md)

## References

* [Docker](https://docs.docker.com/get-docker/)
* [Kubernetes](https://kubernetes.io/docs/setup/)
* [Flask](https://flask.palletsprojects.com/en/1.1.x/)

--

[Back to Root](../README.md)