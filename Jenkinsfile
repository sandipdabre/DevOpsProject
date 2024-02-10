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
                    docker.build("my-tomcat-app:${params.ENVIRONMENT}", '.')
                    docker.image("my-tomcat-app:${params.ENVIRONMENT}").run('-p 8089:8080 -d')
                }
            }
        }

        stage('Deploy') {
            when {
                expression { params.ENVIRONMENT == 'prod' }
            }
            steps {
                script {
                    sh "docker push my-tomcat-app:${params.ENVIRONMENT}"
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
