#!/bin/bash

sudo helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
 
sudo helm install prometheus prometheus-community/prometheus
sudo kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np

sudo kubectl get pods -l app.kubernetes.io/instance=prometheus

sudo minikube service prometheus-server-np

sudo helm repo add grafana https://grafana.github.io/helm-charts

sudo helm install grafana grafana/grafana
sudo kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np

sudo kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

sudo minikube service grafana-np
