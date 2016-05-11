FROM silintl/php7

ARG NAGIOS_PASSWD

ADD nagios3 /etc/nagios3
ADD nagios-plugins /etc/nagios-plugins
ADD nagios-extras /usr/local/share/nagios-extras

# Add playbooks to the Docker image
ADD ansible /opt/ansible
WORKDIR /opt/ansible

# Run Ansible to configure the Docker image
RUN apt-get -y install ansible && ansible-playbook /opt/ansible/site.yml -c local --extra-vars="neontribe_pass=${NAGIOS_PASSWD}" -vv

# Other Dockerfile directives are still valid
EXPOSE 80
# ENTRYPOINT ["apache2ctl", "-DFOREGROUND"]
ENTRYPOINT ["bash"]
