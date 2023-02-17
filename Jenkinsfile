pipeline {
    agent {label "linux"}

    stages {
        stage('Main') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'credentialidtoken', passwordVariable: 'APITOKEN', usernameVariable: 'USERNAME')]) {
                    sh 'set +x; curl -s --user $USERNAME:$APITOKEN -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" $JENKINS_URL/scriptText > credentialIds.txt'
                    sh 'cat credentialIds.txt'
                }
            }
        }
        stage('Compare names to controller') {
            steps {
                while read line.txt; do
                    echo "$p"
                done < credentialIds.txt


                // sh '''
                // list=$(cat list.txt)
                // for str in $list; do
                //     echo "searching for $str"
                //     if grep --include=build.xml -rnw "/var/lib/cloudbees-core-cm/jobs/" -e $str; then
                //         echo "Found $str"
                //         echo $str >> results.txt
                //         break
                //     else
                //         echo "Didn't find $str"
                //     fi
                // done
                // cat results.txt
                // '''
            }
        }
    }
}
