#!/bin/bash
echo "Install Helm Chart Using Script"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
echo "checking version.."
helm version

# add official stable Helm charts repository for your local client.
helm repo add stable https://charts.helm.sh/stable
# Add prometheus Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm search repo prometheus-community
# Create Prometheus namespace
kubectl create namespace prometheus

# Install kube-prometheus-stack
# Below is helm command to install kube-prometheus-stack. The helm repo kube-stack-prometheus (formerly prometheus-operator) comes with a grafana deployment embedded.
helm install stable prometheus-community/kube-prometheus-stack -n prometheus
# Lets check if prometheus and grafana pods are running already
kubectl get pods -n prometheus
kubectl get svc -n prometheus

# In order to make prometheus and grafana available outside the cluster, use LoadBalancer or NodePort instead of ClusterIP.
kubectl edit svc stable-kube-prometheus-sta-prometheus -n prometheus
# change ClusterIP to LoadBalancer     port: 8080  to 9090
kubectl edit svc stable-grafana -n prometheus
# change ClusterIP to LoadBalancer
kubectl get svc -n prometheus

