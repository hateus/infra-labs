# Lab: Yzg3Nj

Launch the Cloud Operations Agent in an Instance, retrieve metrics and then create a Dashboard containing useful information to observe.

## Setup

1. This tutorial requires the `gcloud` and `ansible` command-line tools.

For each step below, run the command in a terminal window.


## Step 1: Enable APIs and Permission for your project.

This tutorial requires both the Observability API.
This may take a couple of minutes to complete.

```
wget https://cloud.google.com/stackdriver/docs/set-permissions.sh -O - | sh
```


## Step 2: Create Application Instance (testing).

```
gcloud compute instances create michael-vm \
    --image=ubuntu-os-cloud/ubuntu-2004-lts \
    --image-project=$PROJECT_ID \
    --machine-type=n1-standard-1 \
    --labels=project=michael-exploration
```


## Step 3: Create a policy to target all VMs with the label project=michael-exploration.

Creating the cluster may take a few minutes.

```
gcloud beta compute instances \
    ops-agents policies create ops-agents-policy-safe-rollout \
    --agent-rules="type=logging,version=current-major,package-state=installed,enable-autoupgrade=true;type=metrics,version=current-major,package-state=installed,enable-autoupgrade=true" \
    --os-types=short-name=ubuntu,version=2004 \
    --group-labels=project=michael-exploration \
```

## Step 4: Install ops-agent to michael-vm.

Retrieve metrics from virtual machine.

```
ansible-playbook -i inventory/instances playbook.yml
```


## Step 5: View the status of the ops-agent service.

Re-run this command at any time to view the current ops-agent state.

```
sudo systemctl status google-cloud-ops-agent"*"
```


## Step 6: View the metric in Cloud Monitoring.

Now, you can create a advanced monitoring dashboard for all your VMs.

[![Monitoring compute infrastructure with the Cloud Ops Agent](https://img.youtube.com/vi/Fzd6WP0_bWM/0.jpg)](https://www.youtube.com/watch?v=Fzd6WP0_bWM)



## Step 7: Delete the VMs.

This prevents further charges from accruing to your GCP account.

```
gcloud compute instances delete michael-vm --zone=us-central2-a
```

Wait about 30 seconds for the Instances to finish deleting in the
background, then move to the next step.
