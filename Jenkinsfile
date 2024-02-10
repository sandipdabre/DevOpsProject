pipeline {
    agent any
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Deployment Environment')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Package') {
            steps {
                script {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build and Run Docker Container') {
            steps {
                script {
                    sh 'sudo docker build -t my-tomcat-app:vannlatest .'
                    sh 'sudo docker run -p 8081:8080 my-tomcat-app:vannlatest'
                }
            }
        }

        stage('Deploy') {
            when {
                expression { params.ENVIRONMENT == 'prod' }
            }
            steps {
                script {
                    sh "sudo docker push my-tomcat-app:vannlatest"
                }
            }
        }
    }

    post {
        success {
            echo 'Docker build and deployment succeeded!'
        }

        failure {
            echo 'Docker build or deployment failed! Sending notifications...'
            // Send notifications or perform actions on failure
        }
    }
}
