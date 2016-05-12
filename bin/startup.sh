#!/bin/bash

service nagios3 start
apache2ctl -DFOREGROUND
