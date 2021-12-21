# Lab: NDNhNj

Launch a Docker Swarm cluster on Amazon Web Services.

## Setup

1. This tutorial requires the `terraform` command-line tools.

For each step below, run the command in a terminal window.


## Step 1: Configure AWS Credential

Get your credential key here

```
aws configure --profile labs
```


## Step 2: Initialize Terraform Script.

Initialization the terraform script may take a few minutes.

```
terraform init
```


## Step 3: Provision the infrastructure.

1. Comment script in the manager and worker nodes section
2. Run `terraform apply`
3. SSH to your bastion machine and create key-pair from there with name `internal-key`
5. Uncomment script in the manager nodes section and run `terraform apply`
6. Run `docker swarm init`
7. Save the command-line to join the Swarm cluster, and put it on `startup-join-cluster-*.sh`


## Step 4: Delete all infrastructure.

This deletes the cluster and its nodes hosted on Compute Engine.

 ```
 terraform destroy
 ```
