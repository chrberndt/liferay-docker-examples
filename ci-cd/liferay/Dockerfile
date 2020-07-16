# Use an official Liferay image as a parent image
FROM liferay/portal:7.3.3-ga4

# Install prerequisities for Ansible
USER root

RUN apk add gcc git libffi-dev musl-dev openssl-dev perl py-pip python python-dev sshpass

# Update pip
RUN pip install --upgrade pip

# Install ansible
RUN pip install git+git://github.com/ansible/ansible.git@devel

# Copy your ansible configuration into the image
#COPY my_ansible_project /ansible

# Run ansible to configure things
#RUN ansible-playbook /ansible/playbook.yml

USER liferay
