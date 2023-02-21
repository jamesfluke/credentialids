pipeline {
    agent {label "controller"}

    stages {
        stage('GetCredentialIDs') {
            //Find all credential IDs on the controller.
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
                    if grep --include=build.xml -rn "/var/lib/cloudbees-core-cm/jobs/" -e $line; then
                        echo $line >> results.txt
                        break
                    fi
                done
                cat results.txt
                '''
            }
        }
    }
}
