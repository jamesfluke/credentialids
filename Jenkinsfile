pipeline {
    agent {label "linux"}

    stages {
        stage('Main') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'ci-deploy-automation', passwordVariable: '11c2847a43dfeb26d025f6241cc4ecdafa', usernameVariable: 'jfluckiger')]) {
                    sh 'set +x; curl -s -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" --user $USERNAME:$APITOKEN $JENKINS_URL/scriptText > credentialIds.txt'
                    sh 'cat credentialIds.txt'
                }
            }
        }
    }
}
