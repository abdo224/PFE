pipeline {
    agent any
    stages {
        stage('Build docker images ') {
            environment {
                dockerHubRegistry = credentials('dockerhub')
            }
            steps {
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