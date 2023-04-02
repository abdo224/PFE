pipeline {
    agent any
    stages {
        stage('Build docker images ') {
            environment {
                dockerHubRegistry = credentials('dockerhub')
            }
            steps {
              script {
                docker.withRegistry( 'https://registry.hub.docker.com' , dockerHubRegistry) {
                    def dockerImage = docker.build("djawed22/repo:latest","-f mysite/Dockerfile .")
                    dockerImage.push()
                }
              }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}