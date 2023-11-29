import sys
import time
import requests
import traceback

class tenant_details():
    def __init__(self):
        self.tenant_url = ""
        self.tenant_token = ""

class metrics_info():
    def __init__(self):
        self.tags = ""
        self.metrics = []

def dtApiCall(endpoint, tenant, metric, tag, csv_str):
  try:
    postfix = metric + "?includeData=true&relativeTime=3days&queryMode=TOTAL&tag="
    #get_param = {'Accept':'application/json', 'Authorization':'Api-Token {}'.format(tenant.tenant_token)}
    get_param = {'Authorization':'Api-Token {}'.format(tenant.tenant_token)}
    query = tenant.tenant_url + endpoint + postfix + tag + "&percentile=95&includeParentIds=true"
    get_data = requests.get(query, headers = get_param)

    if get_data.status_code >=200 and get_data.status_code < 400:
      seriesData = get_data.json()

      for dataSet in seriesData["dataResult"]['dataPoints'].keys():
        csv_str = csv_str + "\n" + str(seriesData["dataResult"]['entities'][dataSet]) + "," + str((seriesData["dataResult"]['dataPoints'][dataSet][0][0])/1000) + "," + str(seriesData["dataResult"]['dataPoints'][dataSet][0][1])
        
  except Exception as e:
    traceback.print_exc()
    print("Exception ",  e)
  finally:
    return csv_str + "\n"
def generate_test_report(csv_str):
  try:
    csv_file = open("Test_report.csv", "w")
    csv_file.write("Entity Name,Timestamp(epoch),Value")
    for line in csv_str:
      csv_file.write(line)
  except Exception as e:
     print ("Exception", e)

if __name__ == "__main__":
   query = "/api/v1/timeseries/"

   tenant = tenant_details()
   metrics_list = metrics_info()

   tenant.tenant_url = sys.argv[1]
   tenant.tenant_token = sys.argv[2]

   metrics_list.tag_value = sys.argv[3]
   metrics_list.metrics = (sys.argv[4]).split(',')
   tag = metrics_list.tag_value

   csv_str = ""
   for metric in metrics_list.metrics:
     metric = "com.dynatrace.builtin:" + metric
     csv_str = dtApiCall(query, tenant, metric, tag, csv_str)

   generate_test_report(csv_str)
