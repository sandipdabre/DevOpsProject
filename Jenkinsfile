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
                timeout(time: 2, unit: 'MINUTES') {
                script {
                    sh 'docker build -t my-tomcat-app:vannlatest1 .'
                    //sh 'docker run -p 8081:8080 my-tomcat-app:vannlatest'
                    sh 'docker tag my-tomcat-app:vannlatest1 vannsann/my-tomcat-app:vannlatest1'
                }
                }
            }
        }

        stage('Deploy') {
            when {
                expression { params.ENVIRONMENT == 'prod' }
            }
            steps {
                script {
                    sh "docker push my-tomcat-app:vannlatest"
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
