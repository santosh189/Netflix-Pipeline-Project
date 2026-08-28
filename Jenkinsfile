pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk   'jdk21'
         }
    
    stages{
            stage('checkout state') {
                 steps {
                        git branch: 'feature-branch-1641', credentialsId: 'GITHUB-CREDS', url: 'https://github.com/santosh189/Netflix-Pipeline-Project.git'
                       }
            }
            stage('jenkins configuration') {
                steps {
                    sh '''
                            java --version
                            echo $JAVA_HOME
                            javac --version
                            mvn -version
                            which java
                            readlink -f $(which java)
                    '''
                }
            }
             stage('build stage') {
                  steps {
                        sh 'mvn clean package'
                     }
              }
             stage('deploy war into tomcat server') {
                 steps{
                     deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat-creds', path: '', url: 'http://13.207.193.214:8081')], contextPath: 'NETFLIX-HOMEPAGE', war: '**/*.war'
                 }
             }
          }
}
