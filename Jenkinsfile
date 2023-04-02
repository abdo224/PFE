pipeline {
    agent any
    stages {
        stage('Build docker images ') {
            steps {
                dir('./mysite'){
                    sh ' docker build -t djawed22/repo:latest . '
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