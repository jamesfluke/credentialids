pipeline {
    agent {label "controller"}

    stages {
        stage('Main') {
            steps {
                
                withCredentials([usernamePassword(credentialsId: 'credentialidtoken', passwordVariable: 'APITOKEN', usernameVariable: 'USERNAME')]) {
                    sh 'rm -f ${workspace}/credentialIds.txt'
                    sh 'set +x; curl -s --user $USERNAME:$APITOKEN -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" $JENKINS_URL/scriptText > ${workspace}/credentialIds.txt'
                    sh 'cat ${workspace}/credentialIds.txt'
                }
            }
        }
        stage('Compare names to controller') {
            steps {
                sh '''
                cat ${workspace}/credentialIds.txt | while read line; 
                do
                    echo "$line"
                    echo "searching for $line"
                    #if grep --include=build.xml -rnw "/var/lib/cloudbees-core-cm/jobs/" -e $line; then
                    if grep --include=build.xml -rn "/var/lib/cloudbees-core-cm/jobs/" -e $line; then
                        #echo "Found $line"
                        echo $line >> ${workspace}/results.txt
                        break
                    #else
                        //echo "Didn't find $line"
                    fi
                done
                cat ${workspace}/results.txt
                '''
            }
        }
    }
}
