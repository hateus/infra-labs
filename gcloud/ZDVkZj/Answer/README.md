# Lab: NDNhNj

Launch a Slack Command Webhook on Google Cloud Function, and then try to access our function from the Slack Command.

## Setup

2. This tutorial requires the `gcloud` command-line tools.
   <a href="https://console.cloud.google.com/cloudshell" target="_blank">Cloud Shell</a>
   provides an environment with these tools preinstalled.

For each step below, run the command in a terminal window.


## Step 1: Deploy NodeJS Application

Creating the cloud function may take a few minutes.

```
gcloud functions deploy helloWorld \
   --runtime nodejs16 
   --trigger-http 
   --allow-unauthenticated
```

## Step 2: Set SLACK_TOKEN Variable

Some random characters and numbers that can be parameters to access our application.

1. Follow [this](https://api.slack.com/interactivity/slash-commands) tutorial to setup slash command
2. You will see Slack Token afterwards
3. Run the command below:

```
gcloud functions deploy helloWorld \
   --runtime nodejs16 \
   --set-env-vars SLACK_TOKEN=<put-your-token> \
   --trigger-http
```


## Step 3: Integrate with Slack Command

1. Get cloud function endpoint
2. Put the endpoint URL in the _Request URL_ section
3. Run the slash command you created in Slack at any time to test the function.


## Step 4: Delete the function.

This deletes the function.

 ```
 gcloud functions delete helloWorld
 ```
