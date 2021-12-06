# 001

- [Basic Configuration](#basic-configuration)
- [Goals](#goals)
- [Resources](#resources)


## Basic Configuration
1. [Install Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
2. [Install Docker Compose](https://docs.docker.com/compose/install/)

## Goals
PT. Mencari Michael sedang membangun aplikasi web, kamu sebagai _Site Reliability Engineer_ ditugaskan untuk menyiapkan seluruh infrastruktur yang diperlukan. 

Seluruh aplikasi dan database sudah dibangun dan berjalan diatas Container. Namun selang berjalannya waktu kemudian, *resource utilization* dari server database semakin tinggi, karena seringnya aplikasi melakukan operasi *query* dengan database. 

> Kamu mulai berpikir, bagaimana cara membangun cluster database? 

Atau dengan kata lain bagaimana cara agar beberapa container database yang dibangun di beberapa server dapat saling bekerja sama. Karena kamu ingin melakukan [*scale out* bukan *scale up*](https://opsani.com/blog/scale-up-vs-scale-out-whats-the-difference/).

## Resources
- https://www.google.com/search?q=NAMA_DATABASE+cluster+docker
- https://www.apress.com/gp/blog/all-blog-posts/what-is-mysql-ndb-cluster/15454530
