# Keras Build for Docker
Contains Dockerfile & example usage scripts. Dockerfile based off of https://github.com/keras-team/keras/blob/master/docker/Dockerfile. This build uses Tensorflow, only.

1. Dockerfile
    - Main build file
2. docker_run.sh
    - Script that builds container from Dockerfile, launching jupyter and printing login instructions
3. docker_exec_keras.sh
    - Launches interactive bash session in docker container
4. docker_build_keras.sh
    - Simple script that builds container from Dockerfile
5. docker-compose.yml
    - Aborted docker-compose file I decided not to use

