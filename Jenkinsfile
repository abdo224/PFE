pipeline {
    agent any
    stages {
        stage('Build docker images ') {
            environment {
                dockerHubRegistry = credentials('dockerhub')
            }
            steps {
              sh  'docker images '  

              script {
                docker.withRegistry( 'https://registry.hub.docker.com' , 'dockerhub') {
                    def dockerImage = docker.build("djawed22/repo:latest","-f mysite/Dockerfile .")
                    dockerImage.push()
                }
              }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing... hh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}