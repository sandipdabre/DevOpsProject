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
                    //to copy git folder to myGit
                    sh 'mkdir myGit'
                    sh 'cp * myGit/'
                }
            }
        }
    }
}
