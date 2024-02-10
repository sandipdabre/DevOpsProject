pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Retrieve the source code from version control
                checkout scm
            }
        }

        stage('Build and Package') {
            steps {
                script {
                    // Build and package the Spring Boot application using Maven
                    sh 'mvn clean package'
                }
            }
        }

        // stage('Build Docker Image') {
        //     steps {
        //         script {
        //             // Build Docker image
        //             docker.build('my-spring-boot-app:latest')
        //         }
        //     }
        // }

        // stage('Run Docker Container') {
        //     steps {
        //         script {
        //             // Run Docker container
        //             docker.image('my-spring-boot-app:latest').run('-p 8080:8080 -d')
        //         }
        //     }
        // }

        // stage('Deploy') {
        //     when {
        //         expression { params.ENVIRONMENT == 'prod' }
        //     }
        //     steps {
        //         script {
        //             // Additional deployment steps for production (e.g., push to Docker registry)
        //             // This step is conditional for the 'prod' environment
        //         }
        //     }
        // }
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
