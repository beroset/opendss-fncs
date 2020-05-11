# opendss-fncs
Software container combining OpenDSS and FNCS

This project is intended to be used in conjunction with [docker_dss](https://github.com/beroset/docker_dss) and is an extension of that project to allow the containerization of [OpenDSS](https://sourceforge.net/projects/electricdss/) with [FNCS](https://github.com/FNCS/fncs).  

## Building the software
The simplest way to build the software is to use either [Podman](https://podman.io/) or [Docker](https://www.docker.com/) and build images directly from the git repository.  

### With Podman
Building with Podman directly from the git repository requires only that Podman is installed, that there is a connection to the internet and that there is sufficient space on your machine to store the images (at the moment, this is about 2.5G, but 2G can be deleted after the build is complete if desired).

    podman build https://github.com/beroset/docker_dss.git -t beroset/opendss && \
    podman build https://github.com/beroset/opendss-fncs.git -t beroset/opendss-fncs

### With Docker
Building with Docker directly from the git repository requires only that Docker is installed, that the Docker daemon is running, and that there is a connection to the internet and that there is sufficient space on your machine to store the images (at the moment, this is about 2.5G, but 2G can be deleted after the build is complete if desired).

    docker build https://github.com/beroset/docker_dss.git -t beroset/opendss && \
    docker build https://github.com/beroset/opendss-fncs.git -t beroset/opendss-fncs
