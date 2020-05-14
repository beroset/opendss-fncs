# opendss-fncs
Software container combining OpenDSS and FNCS

This project is intended to be used in conjunction with [docker_dss](https://github.com/beroset/docker_dss) and is an extension of that project to allow the containerization of [OpenDSS](https://sourceforge.net/projects/electricdss/) with [FNCS](https://github.com/FNCS/fncs).  

## Building the software
The simplest way to build the software is to use either [Podman](https://podman.io/) or [Docker](https://www.docker.com/) and build images directly from the git repository.  

### With Podman
Building with Podman directly from the git repository requires only that Podman is installed, that there is a connection to the internet and that there is sufficient space on your machine to store the images (at the moment, this is about 2.9 GB, but all but 80.2 MB can be deleted after the build is complete if desired).

    podman build https://github.com/beroset/docker_dss.git -t beroset/opendss && \
    podman build https://github.com/beroset/opendss-fncs.git -t beroset/opendss-fncs

### With Docker
Building with Docker directly from the git repository requires only that Docker is installed, that the Docker daemon is running, and that there is a connection to the internet and that there is sufficient space on your machine to store the images (at the moment, this is about 2.9 GB, but all but 80.2 MB can be deleted after the build is complete if desired).

    docker build https://github.com/beroset/docker_dss.git -t beroset/opendss && \
    docker build https://github.com/beroset/opendss-fncs.git -t beroset/opendss-fncs

### Cleaning up
If you started with no Podman or Docker images and list the images (using `podman images` or `docker images`) after the build is complete, you will see something like this:

    REPOSITORY                       TAG           IMAGE ID       CREATED          SIZE
    localhost/beroset/opendss-fncs   latest        da7da33771cb   4 minutes ago    80.2 MB
    <none>                           <none>        7abd9ab508a8   4 minutes ago    908 MB
    localhost/beroset/opendss        latest        fa793f198e81   15 minutes ago   77.1 MB
    <none>                           <none>        49af6d3cbb55   15 minutes ago   1.57 GB
    docker.io/library/debian         buster-slim   e5aad4204d00   3 weeks ago      72.5 MB
    docker.io/library/debian         buster        3de0e2c97e5c   3 weeks ago      119 MB

If you want to conserve space on your hard drive, all of the images except for the most recent one (`localhost/beroset/opendss-fncs`) could be removed.  Alternatively, only the largest two, with tags of `<none>` could be deleted, returning about 2.5 GB of disk space.  The only difference between the `/beroset/opendss` and `/beroset/opendss-fncs` images is that the latter also includes FNCS.  That is, everything that `/beroset/opendss` can do can also be done with `/beroset/opendss-fncs`, so for maximum flexibility, one could always use the fncs version.  

However, if you are planning to modify the containter files and rebuild the images, it may be helpful to leave the large intermediate images in place to speed the rebuild process.
