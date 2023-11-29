import sys
import json
import requests


def check_problem(DT_URL, DT_TOKEN, tag_info):

   endpoint = DT_URL + "/api/v1/problem/feed?relativeTime=day&tag=" + tag_info
   get_param = {'Accept':'application/json; charset=utf-8', 'Authorization':'Api-Token {}'.format(DT_TOKEN)}
   config_post = requests.get(endpoint, headers = get_param)
   jsonObj = json.loads(config_post.text)

   problem_count = 0
   print(jsonObj)

   problem_list = jsonObj["result"]["problems"]
   for i in range(len(problem_list)):
     if (problem_list[i]["status"] == "OPEN"):
       print (problem_list[i])
       problem_count = problem_count + 1
   return problem_count


if __name__ == "__main__":
   DT_URL = sys.argv[1]
   DT_TOKEN = sys.argv[2]
   tag_info = sys.argv[3]

   problem_count = check_problem(DT_URL, DT_TOKEN, tag_info)
   sys.exit(problem_count)
