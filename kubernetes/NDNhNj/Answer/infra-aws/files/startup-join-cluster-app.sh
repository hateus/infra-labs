#!/bin/bash

export OS=xUbuntu_20.04 
export VERSION=1.22 
wget https://gist.githubusercontent.com/michaelact/8353864bcfc34b0fb4468ef92e5932a7/raw/73e43f5e53d375e9cb97a5c912ba4ed02e3a5130/install-k8s.sh -O - | sh

# Fill in the command below:
# kubeadm join <control-plane-host>:6443 --token <token> --discovery-token-ca-cert-hash <ca-cert>
