set +x; curl -s -d "script=import com.cloudbees.plugins.credentials.*;def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null );for (c in credentialids) {println(c.id)};" --user $USERNAME:$APITOKEN $JENKINS_URL/scriptText > credentialIds.txt'



set +x; curl -s -d "

import com.cloudbees.plugins.credentials.*
def credentialids = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class, Jenkins.instance, null, null )
for (c in credentialids) {
  println(c.id)
  };
  
  --user $USERNAME:$APITOKEN $JENKINS_URL/scriptText > credentialIds.txt'