pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World with GitHub hook5'
            }
        }
        stage('Wait') {
            steps { 
                sh'''
                sleep 60
                '''
            }
        }
    }
}
