# Run Application How To

This article explains how to use Flask Hello image and run the app inside Kubernetes

## Step by Step

First of all you have to start your Kubernetes cluster.
This deployment uses Traefik as Load Balancer. [Read more.](https://doc.traefik.io/traefik/v1.7/user-guide/kubernetes/)

```bash
minikube start
## Output should look like:
##I1116 10:41:53.345578   20896 translate.go:65] Getting system locale failed: Could not detect Language
##😄  minikube v1.15.0 on Darwin 10.13.6
##✨  Automatically selected the virtualbox driver
##💿  Downloading VM boot image ...
##    > minikube-v1.15.0.iso.sha256: 65 B / 65 B [-------------] 100.00% ? p/s 0s
##    > minikube-v1.15.0.iso: 181.00 MiB / 181.00 MiB [] 100.00% 28.19 MiB p/s 7s
##👍  Starting control plane node minikube in cluster minikube
##💾  Downloading Kubernetes v1.19.4 preload ...
##    > preloaded-images-k8s-v6-v1.19.4-docker-overlay2-amd64.tar.lz4: 486.35 MiB
##🔥  Creating virtualbox VM (CPUs=2, Memory=4000MB, Disk=20000MB) ...
##🐳  Preparing Kubernetes v1.19.4 on Docker 19.03.13 ...
##🔎  Verifying Kubernetes components...
##🌟  Enabled addons: storage-provisioner, default-storageclass
##🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

## Enable add-on for Ingress
```bash
minikube addons enable ingress
```

## Add required repo to use Traefik Helm Chart and install it
```bash
helm repo add traefik https://helm.traefik.io/traefik
helm install my-traefik traefik/traefik --version 9.10.1
## Enable ingress add-on
minikube addons enable ingress
## Enable RBAC for Traefik in case you are running K8s +1.16
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v1.7/examples/k8s/traefik-rbac.yaml
## Deploy Traefik using Deployment object
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v1.7/examples/k8s/traefik-deployment.yaml
## Submit the Ingress to the cluster
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v1.7/examples/k8s/ui.yaml
## 

```

--

[Back to Flask Hello Root](./flaskhello.md)