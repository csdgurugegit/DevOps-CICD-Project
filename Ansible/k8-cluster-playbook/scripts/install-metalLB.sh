#!/bin/bash

# MetalLB installation instructions for Legacy versions
# Ubuntu-20.04 Azure-VM

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/manifests/metallb.yaml

