import docker
import sys

def clean_container():
   try:
     dic={}
     dic["name"] = sys.argv[1]
     client = docker.APIClient(base_url='unix://var/run/docker.sock')
     list_container = client.containers(all=True, filters=dic)

     for container in list_container:
       if container["State"] == "running":
          client.kill(container["Id"])
       client.remove_image(container["Image"],force=1)
       client.remove_container(container["Id"], force=1)

   except Exception as e:
     return 

   finally:
     return

if __name__ == "__main__":
    clean_container()
