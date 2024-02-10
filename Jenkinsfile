pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Copy git folder') {
            steps {
                script {
                    sh 'mkdir myGit'
                    sh 'cp * myGit/'
                }
            }
        }
    post {
        success {
            echo 'Copying Git folder is succeeded!'
        }

        failure {
            echo 'Copying Git folder is failed!'
        }
    }
}
