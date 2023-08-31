pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Copy WAR from local to repo') {
            steps {
                sh 'docker cp /var/lib/jenkins/workspace
/work/target/*.war rouiss-tomcat:/user/local/tomcat/webapps/*.war '
            }
        }
        stage('Push to GitHub') {
            steps {
                sh '''
                git config user.email "smdrouis@gmail.com"
                git config user.name "Samidox"
                git *.war
                git commit -m "Auto-commit: Add generated WAR file"
                git push https://${Samidox}:${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}@github.com/${Samidox}/${docker}.git
                '''
            }
        }
    }
}
