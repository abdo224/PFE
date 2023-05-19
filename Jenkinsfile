pipeline {
    agent any
    stages {
        // build our application
        stage('build'){
            steps {
                sh 'touch version.py'
                sh 'python version.py'
            }
        }
        // test our application 
        stage('test'){
            steps {
                sh 'python --version'
            }
        }
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
                sh "docker system prune -f"
                script {
                   docker.withRegistry( 'https://registry.hub.docker.com' , dockerHubRegistry) {
                      def dockerImage = docker.build(appRegistry + ":${ImgTag}","-f Dockerfile .")
                      dockerImage.push("${ImgTag}")
                  }
                }
             }
            }
        }
      
       // deploy the chart to the k8s cluster setup     
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

// define function to get docker image tag
def getImgTag(branchName) {
     // This function return staging by default.
     if(branchName == "main")  {
         return "prod";
     }
     else {
         return "staging";
     }
     
}
// define function to get environment name
def getEnvName(branchName) {
     // This function return staging by default.
     if(branchName == "main")  {
         return "prod";
     }
   
     else {
         return "staging";
     }
     
}