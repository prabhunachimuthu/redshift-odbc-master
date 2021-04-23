#!/bin/bash

# export ODBCSYSINI=${HOME}/.apt/usr/lib/redshift/odbc/conf/

# echo "[redshift]
# Description=RedshiftDB
# Driver=RedshiftDSIIDriver
# Locale=en-US
# PORT=5439
# SSL=on
# CLIENT_SESSION_KEEP_ALIVE=true
# uid=${REDSHIFT_USERNAME}
# pwd=${REDSHIFT_PASSWORD}
# server=${REDSHIFT_SERVER}
# database=${REDSHIFT_DATABASE}
# " > ${ODBCSYSINI}/odbc.ini

# Install the Redshift ODBC driver manager
# apt-get update \
    # && apt-get install -y --no-install-recommends unixodbc

# if ! curl -s https://s3.amazonaws.com/redshift-downloads/drivers/odbc/1.4.27.1000/AmazonRedshiftODBC-64-bit-1.4.27.1000-1.x86_64.deb -o driver.deb; then
    # echo 'Failed to download Redshift ODBC Driver!' 1>&2
    # exit 1
# fi

# # Install the Redshift ODBC driver
# apt install ./driver.deb
 
