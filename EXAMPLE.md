    export ANSIBLE_VAULT_PASSWORD_FILE=0987654321
    docker build --build-arg NAGIOS_PASSWD=1234567890 -t nagios .
