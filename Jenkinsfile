pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World with GitHub hook test2'
            }
        }
        stage('Create file') {
            steps {
                sh "touch /users/jfluckiger/AWESOMEFILE"
            }
        }
    }
}
