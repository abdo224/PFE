pipeline {
    agent any
    stages {
        // build and publish docker image in docker hub registry
        stage('Build docker images & puplish to docker hub registry') {
            when {
                 expression { BRANCH_NAME ==~ /(main|develop)/ }
            }
            environment {
                dockerHubRegistry = 'dockerhub'
                ImgTag= getImgTag(BRANCH_NAME)
                appRegistry = 'djawed22/repo'


            }
            steps {
              dir('./mysite'){
                // clean up docker images
                sh "docker system prune -y"
                script {
                   docker.withRegistry( 'https://registry.hub.docker.com' , dockerHubRegistry) {
                      def dockerImage = docker.build(appRegistry + ":${ImgTag}","-f Dockerfile .")
                      dockerImage.push("${ImgTag}")
                  }
                }
             }
            }
        }    
       stage('Deploy'){
            when {
                 expression { BRANCH_NAME ==~ /(main|develop)/ }
            }
            environment {
                EnvName = getEnvName(BRANCH_NAME)
            }
            steps {
                script {
                    withKubeConfig([credentialsId: 'k8s']) {
                        
                        sh "sh ./deploy.sh k8s-native ${EnvName}"
                    }
                }

                
            }
       }
    
    }
  } 


 def getImgTag(branchName) {
     // This function return staging by default.
     if(branchName == "master")  {
         return "prod";
     }
     else {
         return "staging";
     }
     
}

def getEnvName(branchName) {
     // This function return staging by default.
     if(branchName == "master")  {
         return "prod";
     }
     // production branch is deployed manually in prod and automatically in preprod.
     else {
         return "staging";
     }
     
}