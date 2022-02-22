FROM python:3.10

# Ansible needs sshpass
RUN apt-get update && apt-get -y install sshpass gcc

# Install Ansible
RUN python -m pip install ansible[azure] azure-cli
RUN ansible-galaxy collection install community.general azure.azcollection

RUN : \
  && mkdir /home/jenkins \
  && addgroup --gid 1000 jenkins \
  && useradd --uid 1000 --gid 1000 -d /home/jenkins jenkins \
  && chown jenkins:jenkins /home/jenkins
  
 USER jenkins:jenkins
 
 
