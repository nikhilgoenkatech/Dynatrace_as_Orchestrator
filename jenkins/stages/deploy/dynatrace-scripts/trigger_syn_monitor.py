import sys
import json
import requests

# *******************************************************************************    
#           Function to fetch execution id using API v2 endpoint
# *******************************************************************************    

def trigger_on_demand_monitor(DT_URL, DT_TOKEN, payload):
  try:
    data = {}

    query = str(DT_URL) + "/api/v2/synthetic/executions/batch/"
    post_param = {'Content-Type':'application/json', 'Authorization':'Api-Token {}'.format(DT_TOKEN)}
    populate_data = requests.post(query, headers = post_param, data = json.dumps(payload))

    if populate_data.status_code >=200 and populate_data.status_code <= 400:
      data = populate_data.json()

    elif populate_data.status_code == 401:
      msg = "Auth Error"

  except Exception as e:
    print("Exception in trigger_on_demand_monitor" + str(e))

  finally:
    print("Succesfully completed trigger_on_demand_monitor")
    return data

# *******************************************************************************    
#             Main function 
# *******************************************************************************    
if __name__ == "__main__":
  try:
      DT_URL = sys.argv[1]
      DT_TOKEN = sys.argv[2]

      print(DT_URL)
      tag = sys.argv[3] + "-" + sys.argv[4]
      payload = {
      "group": {
       "tags": [
           tag
          ]
        }
      }

      data = trigger_on_demand_monitor(DT_URL, DT_TOKEN, payload)
      print(data)
      batchId = data["batchId"]

  except Exception as e:
    print("Exception in main " + str(e))

  finally:
    print("Succesfully completed main")
    sys.exit(batchId)
