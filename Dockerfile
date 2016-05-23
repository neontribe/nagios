FROM silintl/php7

ARG NAGIOS_PASSWD
ARG SSHKEY_PASSWD

# Add playbooks to the Docker image
ADD ansible /opt/ansible
ADD bin /opt/ansible/bin
ADD ssh /opt/ansible/ssh
# Add the nagios config for ansible to use
ADD nagios3 /opt/ansible/nagios3
ADD nagios-plugins /opt/ansible/nagios-plugins
ADD nagios-extras /opt/ansible/nagios-extras

WORKDIR /opt/ansible

# Run Ansible to configure the Docker image
RUN apt-get -y install ansible && ansible-playbook /opt/ansible/site.yml -c local --extra-vars="neontribe_pass=${NAGIOS_PASSWD} sshkey_passwd=${SSHKEY_PASSWD}"

# Other Dockerfile directives are still valid
EXPOSE 80
# ENTRYPOINT ["apache2ctl", "-DFOREGROUND"]
ENTRYPOINT ["/opt/ansible/bin/startup.sh"]
