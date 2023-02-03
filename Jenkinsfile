pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World with GitHub hook'
            }
        }
        stage('Wait') {
            steps { 
                sleep time: 2, unit: 'MINUTES'
            }
        }
    }
}
