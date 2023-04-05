pipeline {
    agent any
    stages {
        
        stage('Build docker images & puplish to docker hub registry') {
            when {
                 expression { BRANCH_NAME ==~ /(master|develop)/ }
            }
            environment {
                dockerHubRegistry = 'dockerhub'
                ImgTag= getImgTag(BRANCH_NAME)
                appRegistry = 'djawed22/repo'


            }
            steps {
              dir('./mysite'){
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
                 expression { BRANCH_NAME ==~ /(master|develop)/ }
            }
            environment {
                EnvName = getEnvName(BRANCH_NAME)
            }
            steps {
                script {
                    withKubeConfig([credentialsId: 'k8s']) {
                        
                        sh "sh ./k8s-native-chart/deploy.sh k8s-native ${EnvName}"
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