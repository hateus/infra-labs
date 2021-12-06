# 001

- [Basic Configuration](#basic-configuration)
- [Configuration Structure](#configuration-structure)
- [Goals](#goals)
  - [Virtual Private Cloud](#virtual-private-cloud)
  - [Virtual Machine](#virtual-machine)
- [Resources](#resources)

<p align="center">
    <img src="Lab - Terraform-Easy - app.diagrams.net.png"></img>
</p>

## Basic Configuration
Seluruh _virtual machine_ menggunakan `t2.micro` dengan sistem operasi Ubuntu 20.04 LTS agar tetap gratis.

Persyaratan berikut harus diterapkan pada seluruh server:
- Buatlah 1 key-pairs lalu pakai _key_ tersebut sebagai akses masuk kita ke _virtual machine_.
- Docker Engine dan Docker Client sudah terinstall pada setiap _Virtual Machine_.

## Configuration Structure
- Simpan `.tfstate` di bucket s3.
- Enkripsi file tersebut
- Penggunaan `resources` berbasis `modules`

## Goals
PT. Mencari Michael sedang membangun aplikasi web, kamu sebagai _AWS Expert_ ditugaskan untuk menyiapkan seluruh infrastruktur yang diperlukan, termasuk keamanan dasar dari sisi Cloud. 

Seluruh aplikasi yang ada sudah berbasis micro-service, dan ingin dibangun diatas Container. Layanan _Containerization_ populer dan tangguh saat ini adalah Docker. Docker Engine dari beberapa _virtual machine_ bisa di gabungkan menjadi cluster yang saling berbagi beban. 

### Virtual Private Cloud
- Pastikan seluruh zona / subnet dapat saling terhubung melalui Internet Gateway Zone.

### Virtual Machine
- Hanya _virtual machine_ manager yang dapat di akses dari jaringan luar
- _Virtual Machine_ manager merupakan Docker Swarm dengan pangkat Manager
- Seluruh _virtual machine_ yang ada di _EC2 Auto Scale Group_ adalah Worker
- Sesuaikan _security group_ dengan port yang dibutuhkan _virtual machine_ Manager

> Catatan: Tidak seluruh intruksi saya letakkan di gambar topologi ataupun penjelasan ini, jadi kalian bisa ber-explorasi berdasarkan pemahaman kalian.

# Resources
- https://www.sumologic.com/glossary/docker-swarm/
- https://www.terraform.io/docs/language/settings/backends/s3.html
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
