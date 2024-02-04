# docker-cpymad
Beam dynamics repository with `cpymad` and `MAD-X` configuration for running jupyter notebooks, locally inside a docker container or on [mybinder.org](https://mybinder.org/).

Launch an interactive binder instance here:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/aoeftiger/docker-cpymad/HEAD)

The published docker image is found here:

[![Docker](https://shields.api-test.nl:/docker/image-size/aoeftiger/docker-cpymad?logo=docker)](https://hub.docker.com/r/aoeftiger/docker-cpymad)

## Running the container
The docker container can be run on the command line via

    JUPYTER_TOKEN=madx docker run -p 8888:8888 -e JUPYTER_TOKEN -e CHOWN_HOME=yes -e CHOWN_HOME_OPTS='-R' -v $HOME:/home/jovyan/home/ aoeftiger/docker-cpymad

where

 - `JUPYTER_TOKEN=madx` sets the token (password) for entering the jupyter server
 - `-p 8888:8888` forwards the jupyter server port from inside the container to your outside system (change the first port to your liking)
 - `-v $HOME:/home/jovyan/home` binds your home directory to inside the docker container such that you can save and load notebooks.

Next you can open your browser and load the page [https://localhost:8888/?token=madx](https://localhost:8888/?token=madx) to connect to the running jupyter lab server.

## Building locally
The docker container for this repository can be built locally by running on the command line

    docker build -t aoeftiger/docker-cpymad .

## Troubleshooting
If you face permission issues with accessing your home directory from within the container, you might want to provide your user ID and group ID explicitly to the container as a solution.

On linux, check your user and group IDs via the CLI command `$ id` and use these values when running the container as above but with the additional arguments:

    [...] --user root -e NB_UID=<your user id> -e NB_GID=<your group id> [...]

Add these comments before the mount instruction `-v [...]`.

For further information, follow [the guide on jupyter-docker-stacks.readthedocs.io](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/troubleshooting.html#permission-denied-when-mounting-volumes), see specifically the second point under "Some things to try".

