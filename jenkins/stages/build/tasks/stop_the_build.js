import { execution } from '@dynatrace-sdk/automation-utils';

export default async function ({ execution_id }, buildno) {
  //Replace the below variables 
  let url = 'https://myjenkins/crumbIssuer/api/xml';
  const JENKINS_USER = 'myuser';
  const JENKINS_API_TOKEN='mytoken';
  const JOB_NAME='myjobname'

    let response = await fetch(url, {
      headers: {
      'Authorization': `Basic ${btoa(JENKINS_USER + ':' + JENKINS_API_TOKEN)}`,
      },
    });

    if (!response.ok) {
      const responseText = await response.text();
      throw new Error(`Request failed with status ${response.status}. Response text: ${responseText}`);
    }
    const xml = await response.text();
    const crumb = (xml.match(/<crumb>(.*?)<\/crumb>/) || [])[1];

    /* Invoking the API to stop the job*/
    console.log("Stopping the job", ${buildno});
    let stop_build = `https://eu.step.dynatrace.com/jenkins/job/${JOB_NAME}/${buildno}/stop`;
    response = await fetch(stop_build, {
      method: "POST",
      headers: {
      'Authorization': `Basic ${btoa(JENKINS_USER + ':' + JENKINS_API_TOKEN)}`,
      'Jenkins-Crumb': crumb,
      }
      ,  
      data: {
      cancel: true,
      json: JSON.stringify({
      parameter: [
        { name: 'cancelReason', value: "Identified build errors, stopping the job" }
      ]
     })
    },
   });
   console.log('Stop API response status:', response.status);

   if (!response.ok) {
      const responseText = await response.text();
      throw new Error(`Request failed with status ${response.status}. Response text: ${responseText}`);
   }
}
