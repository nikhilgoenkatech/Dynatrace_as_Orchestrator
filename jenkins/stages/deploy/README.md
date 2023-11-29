# Resources for setting up Dynatrace as deploy stage Orchestrator  
This folder contains all the inventories required to setup Dynatrace as Orchestrator for deploy stage.  

# Steps  
During deploy stage, the manifest and information deployment is passed leveraging Dynatrace API calls.  
1. Setup the Jenkins with the Jenkinsfile.
2. **sample-bank-app-service**  folder contains inventories to deploy the application as a docker image.  
3. All scripts for executing API calls to Dynatrace can be found within the **dynatrace-scripts** folder. Additionally, the scripts responsible for making API calls to the deployed application are located in the **sample-bank-app-service-tests** folder.  

# Note
Please note this is in continuation to the build stage. Make corresponding changes if you run it in isolation or use different tags/event annotations.
