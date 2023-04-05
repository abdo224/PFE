#!/bin/bash

helm upgrade --install $1-$2 ./k8s-native-chart -f ./values/$2/values.yaml --namespace $2 