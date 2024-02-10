pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                //to checkout git repository
                checkout scm
            }
        }

        stage('Copy git folder') {
            steps {
                script {
                    //to copy git folder
                    sh 'mkdir myGit'
                    sh 'cp * myGit/'
                }
            }
        }
    post {
        success {
            echo 'Copying Git folder is succeeded!'
        }
    }
}
