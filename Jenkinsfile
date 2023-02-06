pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World with GitHub hook'
            }
        }
        stage('CredentialIDs') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'credentialidtoken', passwordVariable: '1187dc0c09ba60479fff9739bf01b8c748', usernameVariable: 'credentialid')]) {
                    sh 'set +x; curl -s -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" --user $USERNAME:$APITOKEN $JENKINS_URL/scriptText > credentialIds.txt'
                    sh 'cat credentialIds.txt'    
                }
            }
        }
    }
}
