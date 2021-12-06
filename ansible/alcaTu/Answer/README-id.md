# 001

- [Basic Configuration](#basic-configuration)
- [Continuous Deployment Preparation](#continuous-deployment-preparation)
- [Continuous Deployment Pipeline](#continuous-deployment-pipeline)
- [Documentation](https://ansible-runner.readthedocs.io/en/stable/intro.html#runner-input-directory-hierarchy)

## Basic Configuration
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. Install Docker Engine dan Docker Compose pada masing-masing server
3. Taruh IP Address dari server-server Docker Engine di file `inventory/hosts`

## Continuous Deployment Preparation
1. Pilih platform yang akan kalian gunakan untuk menyimpan pipeline _Continuous Deployment_
2. Simpan file-file rahasia yang telah terenkripsi dengan tool yang terintegrasi dengan Platform Continuous Deployment kalian di `secrets/`

## Continuous Deployment Pipeline
1. Dekripsi file environment variabel terkait service yang akan di deploy ke `project/deployment/roles/deployment/files/.env`
2. Dekripsi file _private ssh key_ yang digunakan untuk koneksi ke Server ke `env/ssh_key`
3. Pastikan environment variable yang diperlukan sudah tersedia pada runtime Server Continuous Deployment
4. Jalankan `./deploy.sh`
