pipeline {
    agent {label "controller"}

    stages {
        stage('Main') {
            steps {
                
                withCredentials([usernamePassword(credentialsId: 'credentialidtoken', passwordVariable: 'APITOKEN', usernameVariable: 'USERNAME')]) {
                    sh 'rm -f credentialIDs.txt'
                    sh 'set +x; curl -s --user $USERNAME:$APITOKEN -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" $JENKINS_URL/scriptText > credentialIds.txt'
                    sh 'cat credentialIds.txt'
                }
            }
        }
        stage('Compare names to controller') {
            steps {
                sh '''
                sh 'rm -f results.txt 2> /dev/null'
                cat credentialIds.txt | while read line; 
                do
                    echo "$line"
                    echo "searching for $line"
                    #if grep --include=build.xml -rnw "/var/lib/cloudbees-core-cm/jobs/" -e $line; then
                    if grep --include=build.xml -rn "/var/lib/cloudbees-core-cm/jobs/" -e $line; then
                        #echo "Found $line"
                        echo $line >> results.txt
                        break
                    #else
                        //echo "Didn't find $line"
                    fi
                done
                cat results.txt
                '''
            }
        }
    }
}
