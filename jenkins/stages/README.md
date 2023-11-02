# Pipeline stages
Typically a pipeline consists of the following stages  
1. Build
2. Deploy
3. Test
4. Validation

Leveraging Dynatrace workflow, automation and other native features, orchestrating the different stages within the pipeline.  
![DT_overview_diagram](https://github.com/nikhilgoenkatech/Dynatrace_as_Orchestrator/assets/52188007/3252346f-74e1-41b8-8500-fb9e432ec41a)  

# Directory structure  
Each stage has a directory associated with its name, which contains the resources for that stage, as well as additional sub-directories. The directory structure would look like below   
**stage-name**  
   |-- tasks  
   |-- workflow  
   |-- dashboard  

## Tasks  
The "Tasks" folder houses the JavaScripts for various tasks within the stage workflow.These can be configured either individually or integrate them into the overall workflow.  

## Workflow  
The "Workflow" folder contains the workflow sample for using Dynatrace as an orchestrator for that stage.  

## Dashboard  
This folder includes the necessary components, such as workflow files, dashboard.json, and tasks, which can be utilized to establish a dashboard that offers insights and visibility into that specific stage of the pipeline.  
