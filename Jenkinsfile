pipeline {
    agent {label "controller"}

    stages {
        stage('GetCredentialIDs') {
            //Find all credential IDs.
            steps {
                withCredentials([usernamePassword(credentialsId: 'credentialidtoken', passwordVariable: 'APITOKEN', usernameVariable: 'USERNAME')]) {
                    sh 'rm -f results.txt'
                    sh 'set +x; curl -s --user $USERNAME:$APITOKEN -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" $JENKINS_URL/scriptText > credentialIds.txt'
                    sh 'cat credentialIds.txt'
                }
            }
        }
        stage('Find jobs with credentials') {
            steps {
                script {
                    def credentialIds = readFile('credentialIds.txt').trim().split('\n')
                    for (String line : credentialIds) {
                        sh "grep --include=build.xml -rn \"$JENKINS_HOME/jobs/\" -e \"$line\" | cut -d '/' -f 6 | uniq | awk '{print \$0 \" $line\"}' >> results.txt"
                    }
                }
            }
        }
        stage('Display results'){
            steps {
                sh 'cat results.txt'
            }
        }
    }
}
