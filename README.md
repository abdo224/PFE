
# DESCRPTION
this is my final year project consist of deploying a kubernetes-native application using helm chart.

# K8S directiry 
contains all kubernetes manifest files for deploying the django app along with mysql .
*NB: we dont use this directory for deploying , we use it just for test purposes .

# Complete Guide to use this repo
@ first of all you need to have some prerequistes :

1.Docker ----------> to be installed in your machine 
2.Kubernetes ----------> install some virtual cluster like K3s Or MiniKube  
3.Helm ----------------> to be installed in your machine 
4.Monitoring tools (Prometheus)
5.CI/CD tools (Jenkins) -------------> install it as a Docker container Or directly in your machine .

@ Clone this repo : git clone git@github.com:abdo224/PFE.git

So start modify in the code and push it in your own repo , and Jenkins will do everything everything for you .