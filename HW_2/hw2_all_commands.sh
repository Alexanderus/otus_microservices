#!/bin/bash
kubectl create namespace hw2 && helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/ && helm repo update && helm install nginx ingress-nginx/ingress-nginx --namespace hw2 -f nginx-ingress.yml 
kubectl apply -n hw2 -f ./manifests/. 
printf "\n\n # otus homework \n 127.0.0.1   arch.homework \n" | sudo tee -a /etc/hosts
minikube service nginx-ingress-nginx-controller -n hw2
curl -v http://arch.homework:40803/otusapp/aleksandr/health