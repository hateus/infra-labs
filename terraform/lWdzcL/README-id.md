# 002

- [Configuration Structure](#configuration-structure)
- [Goals](#goals)
  - [Virtual Private Cloud](#virtual-private-cloud)
  - [Images](#images)
  - [Elastic Container Service](#ecs)
- [Resources](#resources)

<p align="center">
  <img src="Lab - Terraform-Easy - app.diagrams.net.png"></img>
</p>

## Configuration Structure
- Simpan `.tfstate` di bucket s3.
- Enkripsi file tersebut

## Goals
PT. Mencari Michael telah membangun aplikasi web, kamu sebagai _AWS Expert_ ditugaskan untuk menyiapkan seluruh infrastruktur yang diperlukan, termasuk keamanan dasar dari sisi Cloud. 

Seluruh aplikasi yang ada sudah berbasis micro-service, dan ingin dibangun diatas Container. Pada lab 001 kita menggunakan EC2 yang sudah terinstall Docker Engine, sekarang dengan arsitektur yang sama, kita ingin me-migrasi aplikasi ke ECS (Elastic Container Service). 

> Kenapa ECS?

Ini merupakan layanan _native_ dari AWS dengan beberapa benefit. Jadi kita tidak perlu me-manage _EC2 instance_ seperti sebelumnya. 

<p align="center">
  <img src="https://d1.awsstatic.com/re19/FargateonEKS/Product-Page-Diagram_Fargate%402x.a20fb2b15c2aebeda3a44dbbb0b10b82fb89aa6a.png"></img>
</p>

## Virtual Private Cloud
- Pastikan seluruh subnet saling terhubung dan juga bisa berselancar di internet melalui NAT Gateway.

## Images
- Clone repository `https://github.com/redis-developer/basic-redis-chat-app-demo-nodejs`
- Buatlah _docker image_ dari direktori _repository_ [ini](https://github.com/redis-developer/basic-redis-chat-app-demo-nodejs/tree/main/server) lalu simpan di ECR (Elastic Container Registry)
- Gunakan juga _image_ redis dari Docker Hub

## ECS
- Deploy redis di `Database Zone`
- Deploy _chat app_ di `App Zone`

> Catatan: Tidak seluruh intruksi saya letakkan di gambar topologi ataupun penjelasan ini, jadi kalian bisa ber-explorasi berdasarkan pemahaman kalian.

# Resources
- https://github.com/redis-developer/basic-redis-chat-app-demo-nodejs/
- https://registry.terraform.io/browse/modules
- https://registry.terraform.io/modules/telia-oss/ecs-fargate/aws/latest
