#!/bin/bash

# for more information see: https://docs.microsoft.com/fr-fr/sql/linux/quickstart-install-connect-docker?view=sql-server-2017

if [[ "$(docker container ls | grep medical-mssql 2> /dev/null)" == "" ]]; then
	docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=C0mPliC4tedP4ssw0rd' \
	   -p 1433:1433 --name medical-mssql \
	   -d mcr.microsoft.com/mssql/server:2017-latest
fi

docker start medical-mssql