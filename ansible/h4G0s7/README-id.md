# 001

- [Basic Configuration](#basic-configuration)
- [Goals](#goals)
- [Resources](#resources)

<p align="center">
    <img src="Lab - Ansible - app.diagrams.net.png"></img>
</p>

## Basic Configuration
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Goals
PT. Mencari Michael sedang membangun _Microservices App_. Seluruh aplikasi tersebut dibangun diatas Container.

Berbicara container, tidak jauh-jauh dengan Docker. Proses development aplikasi sudah pasti membutuhkan Docker Engine. Sayangnya _resource utilization_ yang dibutuhkan Docker Engine dan kawan-kawan lumayan besar, laptop developer tidak sanggup memenuhi kebutuhan tersebut.

> Kamu mulai berpikir, bagaimana bila para developer menggunakan Docker Engine yang terpusat? Jadi bila di Engine tersebut menginstall 1 Database, semua developer dapat menggunakannya. 

Akhirnya, ketemu [artikel](https://doexploit.medium.com/installasi-docker-server-dan-client-di-mesin-berbeda-menggunakan-ssh-e48db2db712e) yang menjelaskan bagaimana cara koneksi Docker Engine dari Publik menggunakan SSH. 

Namun PT. Mencari Michael mempunyai banyak sekali tim kecil developer yang membangun aplikasi besar tersebut. Berarti banyak juga Server Docker Engine yang perlu diinstall. Dari sini kamu melihat peluang otomatisasi, **lakukan keahlianmu**.


## Resources
- https://doexploit.medium.com/installasi-docker-server-dan-client-di-mesin-berbeda-menggunakan-ssh-e48db2db712e
