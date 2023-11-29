import sys
import json
import requests
import traceback

###################################################################################################
##           Function to modify SLO definition as per requirement/sent attributes 
##################################################################################################
def populate_payload(payload):
  try:
    payload["name"]=payload["name"].replace("$3",sys.argv[3])
    payload["metricName"] = payload["metricName"].replace("$5",sys.argv[5])
    payload["metricExpression"] = payload["metricExpression"].replace("$3",sys.argv[3]).replace("$4",sys.argv[4])
    payload["filter"] = payload["filter"].replace("$6",sys.argv[6])    
  except Exception as e:
    print("Exception in populate_payload: " + str(e))
    traceback.print_exc()

  finally:
    return payload

#####################################################################################
##                 Function to create SLOs - Response Time and Failure Rate
#######################################################################################
def create_slo(DT_URL, DT_TOKEN):
  #Response time SLO definition  
  PERFTEST_RSP_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - Performance test Response Time SLO",
    "description": "Performance test Response Time SLO",
    "metricName": "perftest_response_time_$5",
    "metricExpression": "((builtin:service.response.time:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):avg:toUnit(MicroSecond,MilliSecond):partition(latency,value(good,lt(36.17))):splitBy():count:fold)/(builtin:service.response.time:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):avg:toUnit(MicroSecond,MilliSecond):splitBy():count:fold)*(100))",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\"),tag(\"BuildVersion:$6\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  } 
  #Failure Rate SLO definition  
  PERFTEST_FAILURE_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - Performance test failed requests",
    "description": "Failure Rate",
    "metricName": "perf_testfailure_rate_$5",
    "metricExpression":"(100)*(builtin:service.errors.total.successCount:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):splitBy())/(builtin:service.requestCount.total:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):splitBy())",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\"),tag(\"BuildVersion:$6\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  }

  
  #Response time SLO definition  
  RSP_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - Response Time SLO",
    "description": "Response Time SLO",
    "metricName": "response_time_$5",
    "metricExpression": "((builtin:service.response.time:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):avg:toUnit(MicroSecond,MilliSecond):partition(latency,value(good,lt(36.17))):splitBy():count:fold)/(builtin:service.response.time:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):avg:toUnit(MicroSecond,MilliSecond):splitBy():count:fold)*(100))",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  } 
  #Failure Rate SLO definition  
  FAILURE_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - Failure Rate",
    "description": "Failure Rate",
    "metricName": "failure_rate_$5",
    "metricExpression":"(100)*(builtin:service.errors.total.successCount:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):splitBy())/(builtin:service.requestCount.total:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),tag($4:$3)\"))):splitBy())",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  }

  #Database Response time SLO definition  
  DB_RSP_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - DB Response Time SLO",
    "description": "Datbase Response Time SLO",
    "metricName": "db_response_time_$5",
    "metricExpression":"((builtin:service.response.time:filter(in(\"dt.entity.service\",entitySelector(\"type(~\"SERVICE~\")\"))):filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),entityName.equals(~\"test~\")\"))):avg:toUnit(MicroSecond,MilliSecond):partition(latency,value(good,lt(36.17))):splitBy():count:fold)/(builtin:service.response.time:filter(in(\"dt.entity.service\",entitySelector(\"type(~\"SERVICE~\")\"))):filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),entityName.equals(~\"test~\")\"))):avg:toUnit(MicroSecond,MilliSecond):splitBy():count:fold)*(100))",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  }
  
  #DB Response Rate SLO definition  
  DB_FAILURE_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - Database Failure Rate",
    "description": "DB Failure Rate",
    "metricName": "db_failure_rate_$5",
    "metricExpression":"(100)*(builtin:service.errors.total.successCount:filter(in(\"dt.entity.service\",entitySelector(\"type(~\"SERVICE~\")\"))):filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),entityName.equals(~\"test~\")\"))):splitBy())/(builtin:service.requestCount.total:filter(in(\"dt.entity.service\",entitySelector(\"type(~\"SERVICE~\")\"))):filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),entityName.equals(~\"test~\")\"))):splitBy())",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  }

  #Application Performance SLO definition  
  APP_RSP_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - App Response Time SLO",
    "description": "Application Response Time SLO",
    "metricName": "app_response_time_$5",
    "evaluationType": "AGGREGATE",
    "metricExpression":"(100)*((builtin:apps.web.actionCount.category:filter(in(\"dt.entity.application\",entitySelector(\"type(APPLICATION)\"))):filter(eq(\"Apdex category\",SATISFIED)):splitBy())/(builtin:apps.web.actionCount.category:filter(in(\"dt.entity.application\",entitySelector(\"type(APPLICATION)\"))):splitBy()))",
    "filter": "type(\"APPLICATION\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  }

  #APP Response Rate SLO definition  
  APP_FAILURE_PAYLOAD = {
    "enabled": "true",
    "name": "$3 - App Failure Rate",
    "description": "App Failure Rate",
    "metricName": "app_failure_rate_$5",
    "metricExpression":"(100)*((builtin:apps.web.countOfErrorsDuringUserActions:filter(in(\"dt.entity.application\",entitySelector(\"type(APPLICATION)\"))))/(builtin:apps.web.actionCount.category:filter(in(\"dt.entity.application\",entitySelector(\"type(APPLICATION)\"))):splitBy()))",
    "evaluationType": "AGGREGATE",
    "filter": "type(\"APPLICATION\")",
    "target": 95,
    "warning": 97.5,
    "errorBudgetBurnRate": {
      "fastBurnThreshold": 1.5,
      "burnRateVisualizationEnabled": "true"
    },
    "timeframe": "-1d"
  }


  try:
    data = {}

    query = str(DT_URL) + "/api/v2/slo/"
    post_param = {'Content-Type':'application/json', 'Authorization':'Api-Token {}'.format(DT_TOKEN)}

    #Create Service SLOs
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(RSP_PAYLOAD)))
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(FAILURE_PAYLOAD)))
    
    #Create Database SLOs
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(DB_RSP_PAYLOAD)))
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(DB_FAILURE_PAYLOAD)))
    
    #Create Application SLOs
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(APP_RSP_PAYLOAD)))
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(APP_FAILURE_PAYLOAD)))
    
    #Create Performance tests SLOs
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(PERFTEST_RSP_PAYLOAD)))
    populate_data = requests.post(query, headers = post_param, data = json.dumps(populate_payload(PERFTEST_FAILURE_PAYLOAD)))
    if populate_data.status_code == 401:
      msg = "Auth Error"

  except Exception as e:
    print("Exception in create_slos: " + str(e))
    traceback.print_exc()

  finally:
    print("Completed create_slos execution")
    
#######################################################################################
##                    Function main
#######################################################################################
if __name__ == "__main__":
  try:
      DT_URL = sys.argv[1]
      DT_TOKEN = sys.argv[2]

      create_slo(DT_URL, DT_TOKEN)

  except Exception as e:
    print("Exception in main " + str(e))

  finally:
    print("Succesfully completed main")
    sys.exit()
