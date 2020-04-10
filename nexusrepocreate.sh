#!/bin/bash

NEXUS_URL=$1
NEXUS_PWD=$2


#wait for nexus initialization
while [ $(curl -X GET -s -o /dev/null -w "%{http_code}" -u admin:${NEXUS_PWD} ${NEXUS_URL}) != 200 ]
do
  echo "waiting for nexus server..."
  sleep 4
done


echo ">creating the repository"
REPO_CHECK=`curl -L -X POST -o /dev/null -w "%{http_code}" ${NEXUS_URL}/service/rest/beta/repositories/docker/hosted \
-H 'Content-Type: application/json' -H 'Content-Type: text/plain' -u admin:${NEXUS_PWD} \
--data '{"name": "fuchicorp","online": true,"storage": {"blobStoreName": "default","strictContentTypeValidation": true,"writePolicy": "allow"},"cleanup": {"policyNames": ["cleanup"]},"docker": {"v1Enabled": true,"forceBasicAuth": true,"httpPort": 8085}}'`

if [ "${REPO_CHECK}" == "201" ];then
echo "> succeed! repository is created. "
else
echo "failed to create the repository, error code ${REPO_CHECK}"
fi