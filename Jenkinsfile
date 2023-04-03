pipeline {
    agent any
    stages {
        stage('Build docker images & puplish to docker hub registry') {
            environment {
                dockerHubRegistry = credentials('dockerhub')
            }
            steps {
              dir('./mysite'){
                script {
                   docker.withRegistry( 'https://registry.hub.docker.com' , 'dockerhub') {
                      def dockerImage = docker.build("djawed22/repo:latest","-f Dockerfile .")
                      dockerImage.push()
                  }
                }
             }
            }
        }    
       stage('Deploy'){
            steps {
                script {
                    withKubeConfig([credentialsId: 'k8s']) {
                        sh "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml"
                        sh "helm list -n staging"
                    }
                }

                
            }
       }
    
    }
  } 