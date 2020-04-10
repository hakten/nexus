#get the scripts list
curl -v -X GET -u admin:admin71 "${NEXUS_URL}/service/rest/v1/script"


#upload a json file example
{
    "name": "pwd",
    "type": "groovy",
    "content": "security.securitySystem.changePassword('admin', 'hoge17')"
  }

curl -H "Accept: application/json" -H "Content-Type: application/json" -d @pass.json -u "admin:hoge16" "${NEXUS_URL}/service/rest/v1/script/"

#run uploaded script
curl -v -X POST -u admin:admin61 -H "Content-Type: text/plain" "${NEXUS_URL}/service/rest/v1/script/pwd/run"

#run it quite with http output
curl -X POST -s -o /dev/null -w "%{http_code}" -H "Content-Type: text/plain" -u admin:admin61 "${NEXUS_URL}/service/rest/v1/script/pwd/run"`

#delete a script
curl -u admin:admin123 -X DELETE ${NEXUS_URL}/service/rest/v1/script/pwd


#get the server success response
curl -X GET -s -o /dev/null -w "%{http_code}" -u admin:admin68 ${NEXUS_URL}


#get repositories
curl -X GET -H "accept: application/json" -u "admin:admin69" "${NEXUS_URL}/service/rest/v1/repositories"

#create a repo
curl --location -X POST -s -o /dev/null -I -w "%{http_code}" ${NEXUS_URL}/service/rest/beta/repositories/docker/hosted \
--header 'Content-Type: application/json' -u admin:${NEXUS_OLD_PWD} --header 'Content-Type: text/plain' \
--data '{"name": "fuchicorp","online": true,"storage": {"blobStoreName": "default","strictContentTypeValidation": true,"writePolicy": "allow"},"cleanup": {"policyNames": ["cleanup"]},"docker": {"v1Enabled": true,"forceBasicAuth": true,"httpPort": 8085}}'

