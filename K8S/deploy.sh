#!/bin/bash

env=$1
# configure kubeclt to use the specified namespace 
sudo kubectl config set-context --current --namespace $env
# create secret and configmap 

kubectl apply -f sql-secret.yml

kubectl apply -f config.yml

#create a pv and pvc for mysql database

kubectl apply -f PV-PVC.yml

#create a deployment for mysql database 

kubectl apply -f sql.yml

#create a deployment for a django application 

kubectl apply -f django.yml

echo "Deployment is done"
