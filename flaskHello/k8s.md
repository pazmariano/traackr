# Run Application How To

This article explains how to use Flask Hello image and run the app inside Kubernetes

## Step by Step

First of all you have to start your Kubernetes cluster

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



--

[Back to Flask Hello Root](./README.md)