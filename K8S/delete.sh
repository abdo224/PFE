#!/bin/bash

#configure kubectl to use the specified namespace 
env=$1

sudo kubectl config set-context --current --namespace $env

# delete secret and configmap

kubectl delete configmap sql-config 

kubectl delete secret sql-secret

#delete pv and pvc

kubectl delete pv mysql-pv 

kubectl delete pvc mysql-pvc
 
#delete deployment for mysql database and django application

kubectl delete deployment --all

#delete service for mysql database and django application

kubectl delete service --all


