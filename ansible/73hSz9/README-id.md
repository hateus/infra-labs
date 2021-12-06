
# 003

- [Basic Configuration](#basic-configuration)
- [Goals](#goals)
- [Resources](#resources)

<p align="center">
    <img src="Lab - Ansible-Bender-Buildah.PNG"></img>
</p>

## Basic Configuration
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. [Install Ansible-Bender](https://ansible-community.github.io/ansible-bender/build/html/installation.html)
3. [Install Buildah](https://github.com/containers/buildah/blob/main/install.md)
4. [Install Podman](https://podman.io/getting-started/installation)
5. Fork Repository [berikut](https://github.com/elgris/microservice-app-example)

## Goals
Pada 1 lab sebelumnya, kamu telah membuat Continuous Deployment untuk aplikasi Toko Online. Para developer senang dengan hasil kerjamu! Selamat. 

Sekarang kamu mendapatkan proyek baru, menyiapkan _Build Pipeline Container Image_. Dengan pengetahuan Ansible yang cukup matang, kamu aktif mendapatkan update terkait Ansible. Pada AnsibleFest Atlanta 2019, seseorang dari komunitas memperkenalkan Ansible Bender, tool untuk membangun Container Image dengan Ansible.

Juga pada saat yang bersamaan, orang tersebut memperkenalkan [buildah](https://github.com/containers/buildah), tool untuk membangun Container Image tanpa memerlukan Daemon seperti Docker Daemon / Docker Engine. 

Kamu akan mencoba Ansible + Buildah pada kesempatan kali ini.

## Resources
- https://github.com/elgris/microservice-app-example
- https://blog.tomecek.net/post/ansible-and-podman-can-play-together-now/
- https://blog.tomecek.net/post/building-containers-with-buildah-and-ansible/
- https://opensource.com/article/19/10/building-container-images-ansible
- https://github.com/ansible-community/ansible-bender/issues/49
- https://github.com/ansible-community/ansible-bender/issues/260
- https://www.ansible.com/hubfs/AnsibleFest%20ATL%20Slide%20Decks/Ansible%20and%20Buildah%20can%20create%20your%20container%20images.pdf
