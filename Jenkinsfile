pipeline {
    agent any
    stages {
        stage('Build docker images ') {
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
        stage('Test') {
            steps {
                echo 'Testing... hhcds'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    
    }
  } 