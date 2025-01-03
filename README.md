# Generic Platform - Jenkins Service

## Overview

Docker image and docker-compose sample configuration to bring up a Jenkins Service to the [Docker Generic Platform (GP)](https://github.com/ayudadigital/docker-generic-platform).

## Configuration

The service is formed by one container:

- **jenkins**: based on [ayudadigital/jenkins-dind](https://hub.docker.com/r/ayudadigital/jenkins-dind) docker image.

## Operation

1. Use the `docker-compose.yml.sample` file as your docker-compose configuration file.

2. Install assets with `devcontrol assets-install`.

3. Start the service with `docker-compose up -d`.

4. Open the url <http://localhost:8080> in a browser and access to the Jenkins GUI.

5. Manage backups of your files:

   1. Execute the cleanup task `docker-compose exed jenkins cleanup` to remove Jenkins workspace and docker disposable data1.
   2. Make a backup executing `docker-compose exec jenkins backup`.
   3. Find the current backup within the `/var/backups/gp/jenkins/` of the container.
   4. Extract the current backup executing `docker cp $(docker-compose ps -q jenkins):/var/backups/gp gp`.

6. Stop the service with `docker-compose stop`.

You can use this docker piece with the [Docker Generic Platform](https://github.com/ayudadigital/docker-generic-platform) project.


## Get plugins list from Jenkins instance

To obtain an updated plugin version list, go to <https://your-instance/script> and execute this

```
Jenkins.instance.pluginManager.plugins.each{
  plugin ->
    println ("${plugin.getShortName()}:${plugin.getVersion()}")
}
```

You will obtain a list with all plugins and their current versions.

## Known issues

None known
