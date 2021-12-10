# docker-cpymad
Beam dynamics repository with `cpymad` and `MAD-X` configuration for running jupyter notebooks, locally inside a docker container or on [mybinder.org](https://mybinder.org/).

Launch an interactive binder instance here:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/aoeftiger/docker-cpymad/HEAD)

The published docker image is found here:

[![Docker](https://shields.api-test.nl:/docker/image-size/aoeftiger/docker-cpymad?logo=docker)](https://hub.docker.com/r/aoeftiger/docker-cpymad)

## Running the container
The docker container can be run on the command line via

    JUPYTER_TOKEN=madx docker run -p 8888:8888 -e JUPYTER_TOKEN -v $HOME:/home/jovyan/src/notebooks/home/ aoeftiger/docker-cpymad

where

 - `JUPYTER_TOKEN=madx` sets the token (password) for entering the jupyter server
 - `-p 8888:8888` forwards the jupyter server port from inside the container to your outside system (change the first port to your liking)
 - `-v $HOME:/home/jovyan/src/notebooks/home` binds your home directory to inside the docker container such that you can save and load notebooks.

Next you can open your browser and load the page [https://localhost:8888/?token=madx](https://localhost:8888/?token=madx) to connect to the running jupyter lab server.

## Building locally
The docker container for this repository can be built locally by running on the command line

    docker build -t aoeftiger/docker-cpymad .
