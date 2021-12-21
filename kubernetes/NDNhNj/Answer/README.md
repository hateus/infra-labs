# Lab: NDNhNj

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/kubernetes-engine-samples&cloudshell_tutorial=README.md&cloudshell_workspace=try-gke/)

Launch a Kubernetes cluster on Google Kubernetes Engine, run a containerized web
application, and then access your application from the Load Balancer.

## Setup

2. This tutorial requires the `kubectl` and `gcloud` command-line tools.
   <a href="https://console.cloud.google.com/cloudshell" target="_blank">Cloud Shell</a>
   provides an environment with these tools preinstalled.

For each step below, run the command in a terminal window.


## Step 1: Enable APIs for your project.

This tutorial requires both the Compute Engine API and Kubernetes Engine API.
This may take a couple of minutes to complete.

```
gcloud services enable compute.googleapis.com; gcloud services enable container.googleapis.com
```


## Step 2: Create a cluster named "michael-cluster" in GCP zone us-west1-a.

Creating the cluster may take a few minutes.

```
gcloud container clusters create michael-cluster -z us-west1-a
```

## Step 3: Deploy a web application from a container image.

A sample container image, `docker.io/michaelact/st-*`, is stored in Docker Hub.

```
kubectl apply -f k8s-manifests/
```


## Step 4: View the pods that were created.

Re-run this command at any time to view the current pod state.

```
kubectl get pods
```


## Step 5: Retrieve information about the web-app service.

Make a note of the external IP address that is returned. If the external IP
address is pending, wait a few moments and then re-run the command.

```
kubectl get service apigateway
```


## Step 6: Make a request to the application.

Replace `[IP-ADDRESS]` with the external IP address returned in the previous step.

```
curl http://[IP-ADDRESS]
```

## Step 7: Delete the Deployment and Service.

This prevents further charges from accruing to your GCP account.

```
kubectl delete -f k8s-manifests/
```

Wait about 30 seconds for the Load Balancer to finish deleting in the
background, then move to the next step.

## Step 8: Delete the cluster.

This deletes the cluster and its nodes hosted on Compute Engine.

 ```
 gcloud container clusters delete michael-cluster --zone us-west1-a
 ```


```

--------------------
FURTHER EXPLORATION:

 * https://blog.learncodeonline.in/kubernetes-core-concepts-namespaces
 * https://blog.learncodeonline.in/kubernetes-core-concepts-deployments
 * https://blog.learncodeonline.in/kubernetes-core-concepts-services
 * https://blog.learncodeonline.in/kubernetes-core-concepts-pods
 * https://idcloudhost.com/panduan/cara-install-kubernetes-dan-kubernetes-cluster-pada-server-private-cloud/
--------------------
