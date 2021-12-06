<p align="center">
    <img src="Lab - Terraform-Apply-Pipeline - app.diagrams.net.png"></img>
</p>

## Connect your Repository to Google Cloud Build

1. Once you clone the repository, push it to your private repository

2. Go to Google Cloud Build Dashboard > Trigger > Connect Repository


## Setup Infrastructure

For this to run, you need to have:

- Terraform
- Service Account Key

Then, follow the steps below:

1. Put your `service_account_key.json` in `key/tf-key.json`

2. Run `terraform init` to initialize the terraform modules

3. Run `terraform apply` to provision below infrastructure:
   - Virtual Private Cloud
   - Redis 


## Prepare CI/CD

For this to run, you need to have understand:

- How `kaniko` works?
- How each service can collaborate?
- How Cloud Run runs your container application?
- Google Cloud Build Schema

Then, follow the steps below:

1. Files that are in the same directory as this README.md file must be adapted to the below directory layout:

```
├── APIGateway
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
├── OrderService
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
├── ProductService
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
├── README.md
├── UserService
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
├── cloudbuild-pr.yaml
└── cloudbuild.yaml
```

2. Done 🎇

> The rest of the things you need to think for yourself is how to organize the environment variable of each services?


## Readings

- https://humanitec.com/blog/how-to-manage-environment-variables
- https://cloud.google.com/build/docs/kaniko-cache
- https://cloud.google.com/build/docs/deploying-builds/deploy-cloud-run
- https://cloud.google.com/build/docs/build-config-file-schema
