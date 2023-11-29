import sys
import time
import logging 
import requests

######################################################################################
#                      Run the load-tests on the endpoint                            #
######################################################################################
def sanity_test(port, no_of_requests, logger, test_hostname, endpoint, req_attr_val):
  try:
    logger.debug("Starting load-test for login request")

    header_value="LoadTestID=" + job_name + ";RequestName=" + req_attr_val
    http_req = "http://" + test_hostname + ":" + str(port) + endpoint
    header = {'x-dynatrace-test':header_value}

    for i in range(int(no_of_requests)):
      rsp = requests.get(http_req,headers=header)

      if rsp.status_code >=400:
        logger.debug("Request failed", rsp.text)

      time.sleep(1)

  except Exception as e:
    logger.critical("Encountered exception while running smoke_test", exc_info=e)

  finally:
    logger.debug("Completed load-test for login request")

######################################################################################
#                      Create load-test                                              #
######################################################################################
#Inputs
#sys.argv[1] = portno on which your application is running
#sys.argv[3]= log_file - this would be my inventory for this test-case(s) and pipeline
#sys.argv[4] = job-name
#sys.argv[5] = hostname - the host on which the application is running


if __name__=="__main__":
   port = sys.argv[1]
   no_of_requests = sys.argv[2]

   job_name = sys.argv[3]
   log_file = sys.argv[4]

   test_hostname = sys.argv[5]
   logging.basicConfig(filename=log_file,
                                filemode='w',
                                format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
                                datefmt='%H:%M:%S',
                                level=logging.DEBUG)
   logger = logging.getLogger()
    
   logger.debug("------------------------Commencing load tests----------------------------")

   sanity_test(port, no_of_requests, logger, test_hostname, "/api/users", "API")
   sanity_test(port, no_of_requests, logger, test_hostname, "/login", "Login")
   sanity_test(port, no_of_requests, logger, test_hostname, "/api/", "URL")

   logger.debug("------------------------load test completed----------------------------")
   logging.shutdown()
