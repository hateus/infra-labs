# Cloud Run

- [Basic Configuration](#basic-configuration)
- [Goals](#goals)
- [Resources](#resources)

## Basic Configuration
Fork repository [berikut](https://github.com/GoogleCloudPlatform/microservices-demo) untuk menjadi objek latihan ini. 

## Goals
- Hanya service `frontend` yang bisa diakses dari luar
- Service `load generator` hanya bisa mengakses service `frontend`
- Service `private` lainnya hanya bisa diakses melalui Service Account
- Gunakan redis yang dikelola Google Cloud

## Resources
- https://cloud.google.com/memorystore/docs/redis
- https://cloud.google.com/run/docs/tutorials/secure-services
- https://stackoverflow.com/questions/67164122/private-service-to-service-communication-for-google-cloud-run
- https://github.com/ahmetb/cloud-run-faq
- https://github.com/ahmetb/cloud-run-faq#are-all-cloud-run-services-publicly-accessible
