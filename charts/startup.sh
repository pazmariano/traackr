#!/bin/bash

echo "##### Deletig existing minikube Cluster"
minikube delete

echo "##### Starting the minikube Cluster"
minikube start

echo "##### Minikube enable AddOn Ingress"
minikube addons enable ingress

echo "##### Deploy Traefik to Cluster"

for i in `ls *.yaml | grep traefik` ; do
  kubectl apply -f $i
done

echo "##### Deploy Custom App to Cluster"

for i in `ls *.yaml | grep -v traefik` ; do
  kubectl apply -f $i
done

echo "##### Add Hosts entry for Flask Hello and Traefik UI"

echo "$(minikube ip) flaskhello.minikube traefik-ui.minikube" | sudo tee -a /etc/hosts

echo "Done"
exit 0
