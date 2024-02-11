pipeline {
    agent none
    stages {
        stage('Test-Build') {
            agent {
                label 'Test_node'
            }
            steps {
                echo 'Running Test job on Test-node...'
                script {
                    echo 'Checking out the Git repository...'
                    checkout scm

                    echo 'Creating /tmp/myGit directory if it does not exist...'
                    sh '[ -d "/tmp/myGit" ] || mkdir "/tmp/myGit"'
                    

                    // Run your test job here, replace the command below with your actual test command
                    def testResult = sh(script: 'mkdir /tmp/myGit', returnStatus: true)

                    // Check if the test job is successful
                    if (testResult != 0) {
                        error 'Test job failed. Aborting the build.'
                    }
                }
            }
        }

        stage('Prod-Build') {
            agent {
                label 'Prod_node'
            }
            steps {
                echo 'Checking out the Git repository...'
                script {
                    echo 'Checking out the Git repository...'
                    checkout scm

                    echo 'Creating /tmp/myGit directory if it does not exist...'
                    sh '[ -d "/tmp/myGit" ] || mkdir "/tmp/myGit"'
                    sh 'cp -r * /tmp/myGit/'
                }
            }
        }
    }
}
