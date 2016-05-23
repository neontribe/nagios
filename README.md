Neontribe Nagios Container
==========================

In the example below replace the 0987654321 with the vault password and the 1234567890 with the password you want to use for the web auth.

    docker build --build-arg NAGIOS_PASSWD=1234567890 --build-arg SSHKEY_PASSWD=starblakewarsseven -t nagios .

    docker run -i -p 9080:80 -t nagios
