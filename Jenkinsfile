pipeline {
    agent any
    
    parameters {
         string(name: 'staging_server', defaultValue: '13.232.37.20', description: 'Remote Staging Server')
    }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Archiving the artifacts'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ("Deploy to Staging"){
                    steps {
                        sh "deploy adapters: [tomcat9(credentialsId: '97c4d89f-f8e3-4fc6-b666-e8f05ebf306c', path: '', url: 'http://18.217.195.195:8080/')], contextPath: '/var/lib/tomcat9/webapps', war: '**/*.war'"
                    }
                }
            }
        }
    }
}
