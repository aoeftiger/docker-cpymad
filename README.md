# docker-cpymad
Beam Dynamics: repository with cpymad and MAD-X configuration for running jupyter notebooks *inside a docker container* e.g. on binder

## How to build docker container
The docker container can be built locally by changing to the prepare-container/ directory and then running
    docker build --force-rm -t aoeftiger/docker-cpymad .
