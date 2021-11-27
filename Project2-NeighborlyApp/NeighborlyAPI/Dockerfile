# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/python:3.0-python3.8-appservice
FROM mcr.microsoft.com/azure-functions/python:3.0-python3.8

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

ENV MyDbConnection=mongodb://proj2cosmosdb:XYcI2E50lPpTTJdBNBdKlE21Ccw1IS9ttZzb4ok2PpcY1LGxWK0cBE7VCpWuK21nxO34vD7fAwP7JG0YkVyPYw==@proj2cosmosdb.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@proj2cosmosdb@
COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot