Neontribe Nagios Container
==========================

In the example below replace the 0987654321 with the vault password and the 1234567890 with the password you want to use for the web auth.

    docker build --build-arg NAGIOS_PASSWD=1234567890 --build-arg SSHKEY_PASSWD=starblakewarsseven -t nagios .
    
    docker run -d -p 9080:80 -t nagios
    
To run in interactive mode:
    
    docker run -i -p 9080:80 -t nagios
    
To attach to the running container

    docker ps
    docker exec -i -t f5e7a3b4f73c /bin/bash

