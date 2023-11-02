import { execution } from '@dynatrace-sdk/automation-utils';

export default async function ({ execution_id }) {

  //Replace the below variables 

  const BASE_URL = 'https://myjenkins-instance';
  const CRUMB_URL = `${BASE_URL}/crumbIssuer/api/xml`;
  const BUILD_URL = `${BASE_URL}/job/my-job-name/build`;
  const JENKINS_USER = 'myuser';
  const JENKINS_API_TOKEN='mytoken';

    let response = await fetch(CRUMB_URL, {
      headers: {
      'Authorization': `Basic ${btoa(JENKINS_USER + ':' + JENKINS_API_TOKEN)}`,
      },
    });
    console.log('Response Status:', response.status);

    if (!response.ok) {
      const responseText = await response.text();
      throw new Error(`Request failed with status ${response.status}. Response text: ${responseText}`);
    }
    const xml = await response.text();
    const crumb = (xml.match(/<crumb>(.*?)<\/crumb>/) || [])[1];

    response = await fetch(BUILD_URL, {
      method: "POST",
      headers: {
      'Authorization': `Basic ${btoa(JENKINS_USER + ':' + JENKINS_API_TOKEN)}`,
      'Jenkins-Crumb': crumb  
      },
    });
    console.log('Response Status:', response.status);

    if (!response.ok) {
      const responseText = await response.text();
      throw new Error(`Request failed with status ${response.status}. Response text: ${responseText}`);
    }
  return { data: crumb };
}
