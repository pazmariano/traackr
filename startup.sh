#!/bin/bash

echo "##### Starting the minikube Cluster"
minikube start

echo "##### Install the app with dependencies."
helm install --dependency-update hello-test01 ./
