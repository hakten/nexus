curl --location --request POST 'https://nexus.fuchicorp.com/service/rest/beta/repositories/docker/hosted' \
--header 'Content-Type: application/json' \
-u admin:admin71 \
--header 'Content-Type: text/plain' \
--data '{
  "name": "fuchicorp",
  "online": true,
  "storage": {
    "blobStoreName": "default",
    "strictContentTypeValidation": true,
    "writePolicy": "allow"
  },
  "cleanup": {
    "policyNames": ["cleanup"]
  },
  "docker": {
    "v1Enabled": true,
    "forceBasicAuth": true,
    "httpPort": 8085
  }
}'
