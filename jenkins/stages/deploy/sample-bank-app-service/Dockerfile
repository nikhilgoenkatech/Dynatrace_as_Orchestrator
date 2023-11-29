FROM node:14

MAINTAINER Nikhil Goenka "dynatraceone@dynatrace.com" 

# Update aptitude with new repo
RUN apt-get update

# Install software 
RUN apt-get install -y git

RUN git clone https://github.com/nikhilgoenkatech/Bank-Sample-app.git 
WORKDIR /Bank-Sample-app/

RUN npm install
EXPOSE 3000

CMD ["npm","start"]
