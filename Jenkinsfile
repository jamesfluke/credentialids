pipeline {
    agent {label "controller"}

    stages {
        stage('GetCredentialIDs') {
            //Find all credential IDs.
            steps {
                withCredentials([usernamePassword(credentialsId: 'credentialidtoken', passwordVariable: 'APITOKEN', usernameVariable: 'USERNAME')]) {
                    sh 'set +x; curl -s --user $USERNAME:$APITOKEN -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" $JENKINS_URL/scriptText > credentialIds.txt'
                    sh 'cat credentialIds.txt'
                }
            }
        }
        stage('CompareIDsToJobs') {
            //Find all credential IDs used in pipelines.
            steps {
                sh '''
                cat credentialIds.txt | while read line; 
                do
                    echo "searching for $line"
                    if grep --include=build.xml -rn "$JENKINS_HOME/jobs/" -e "$line"; then
                    grep --include=build.xml -rn "$JENKINS_HOME/jobs/" -e "$line" | while read result; 
                    do
                        echo "$result" >> results.txt
                    done
            fi
                done
                cat results.txt
                '''
            }
        }
    }
}
