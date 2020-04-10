// import org.sonatype.nexus.blobstore.api.BlobStoreManager;repository.createDockerHosted('docker-hub','https://nexus.ggl.huseyinakten.ner','HUB',null,8085,null,BlobStoreManager.DEFAULT_BLOBSTORE_NAME,true,true);def groupMembers = ['docker-hub', 'docker-internal'];repository.createDockerGroup('docker-all', null, 18443, groupMembers, true);log.info('Script dockerRepositories completed successfully')


import org.sonatype.nexus.blobstore.api.BlobStoreManager

// create hosted repo and expose via https to allow deployments
// repository.createDockerHosted('docker-internal', null, 18444) 

repository.createDockerHosted('docker-hub',             // name
'https://nexus.ggl.huseyinakten.ner',                   // remoteUrl
'HUB',                                                  // indexType
null,                                                   // indexUrl
null,                                                   // httpPort
null,                                                   // httpsPort
BlobStoreManager.DEFAULT_BLOBSTORE_NAME,                // blobStoreName 
true,                                                   // strictContentTypeValidation
true                                                    // v1Enabled
)

// create group and allow access via https
// def groupMembers = ['docker-hub', 'docker-internal']
// repository.createDockerGroup('docker-all', null, 18443, groupMembers, true)


log.info('Script dockerRepositories completed successfully')