# 001

- [Basic Configuration](#basic-configuration)
- [Cara Menggunakan Remote Docker Engine](#cara-menggunakan-remote-docker-engine)

## Basic Configuration
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. [Install Docker Client](https://stackoverflow.com/questions/38675925/is-it-possible-to-install-only-the-docker-cli-and-not-the-daemon)
3. Taruh IP Address dari Server yang akan diinstall Docker Engine di file `inventory/development`
4. Jalankan perintah `ansible-playbook -i inventory/development playbook-init.yml`

## Cara Menggunakan Remote Docker Engine
1. Jalankan perintah `./docker.sh --connect <user> <ip_address>`
2. Jika ingin menutup koneksi, gunakan perintah `./docker.sh --disconnect`
