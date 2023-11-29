#!/bin/bash

# Bash Script that will push a Custom Deployment event to Dynatrace via ${DT_URL}/api/v1/events
# The script also assumes the ${DT_TOKEN} contains your API-Token!
# Either set your Dynatrace Token and URL in this script or pass it as Env Variables to this Shell Script
# DT_TOKEN=YOURAPITOKEN
# DT_URL=https://YOURTENANT.live.dynatrace.com
# When used with Jenkins we suggest to define DT_TOKEN and DT_URL as Global Environment Variables - they will then get passed to your shell script automatically

# Usage:
# ./pushtag.sh ENTITYTYPE TAGCONTEXT TAGNAME TAGVALUE DEPLOYMENTNAME DEPLOYMENTVERSION DEPLOYMENTPROJECT SOURCE CILINK JENKINSURL BUILDURL GITCOMMIT

# Example from command line:
# Pushing a Custom Deployment Event to a HOST with the tag [AWS]Environment:JenkinsTutorial
# ./pushtag.sh HOST AWS Environment JenkinsTutorial DemoDeploy 1.0 MyProject Jenkins http://myjenkins http://myjenkins/job http://myjenins/build gitcommitid

# Example from Jenkins:
# Pushing same Custom Deployment event using Jenkins Propeties
# ./dynatrace-scripts/pushtag.sh HOST AWS Environment JenkinsTutorial ${BUILD_TAG} ${BUILD_NUMBER} ${JOB_NAME} Jenkins ${JENKINS_URL} ${JOB_URL} ${BUILD_URL} ${GIT_COMMIT}

PAYLOAD=$(cat <<EOF
{  "eventType": "CUSTOM_DEPLOYMENT",
   "title":"Deployment",
  "entitySelector":
     "type($1), tag($2)",
  "properties": {
    "dt.event.deployment.release_stage":"$6",
    "dt.event.deployment.release_product":"node-bank2",
    "dt.event.deployment.name":"$7",
    "dt.event.deployment.project": "$5",
    "dt.event.deployment.remediation_action_link": "$8",
    "dt.event.deployment.version": "$4",
    "dt.event.is_rootcause_relevant" : true
   }
}
EOF
)

echo $PAYLOAD
curl -H "Content-Type: application/json" -H "Authorization: Api-Token ${DT_TOKEN}" -X POST -d "${PAYLOAD}" ${DT_URL}/api/v2/events/ingest/
