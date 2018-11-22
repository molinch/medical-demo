#!/bin/bash

# For more information see: https://docs.microsoft.com/fr-fr/sql/linux/quickstart-install-connect-docker?view=sql-server-2017

HostDataPath=c:/medical-mssql-data # where the data is stored on the host, this way if the container is dropped data is kept
AdministratorPassword='C0mPliC4tedP4ssw0rd'

if ! docker top medical-mssql > /dev/null 2>&1; then
	echo "**** Creating Microsoft SQL Server 2017 container ****"
	docker run -v $HostDataPath/:/var/opt/mssql -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$AdministratorPassword" --rm -p 1433:1433 --name medical-mssql -d mcr.microsoft.com/mssql/server:latest
fi

docker start medical-mssql