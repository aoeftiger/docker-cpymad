# docker-cpymad
Beam Dynamics: repository with cpymad and MAD-X configuration for running jupyter notebooks *inside a docker container* e.g. on binder

## How to build the docker container
The docker container can be built locally by running on the command line

    docker build -t aoeftiger/docker-cpymad .

## How to run the docker container
The docker container can be run on the command line via

    JUPYTER_TOKEN=madx docker run -p 8888:8888 -e JUPYTER_TOKEN -v $HOME:/home/jovyan/src/notebooks/home/ aoeftiger/docker-cpymad

where

 - `JUPYTER_TOKEN=madx` sets the token (password) for entering the jupyter server
 - `-p 8888:8888` forward the jupyter server port from inside the docker to your outside system (the first port can be changed to your liking)
 - `-v $HOME:/home/jovyan/src/notebooks/home` binds your home directory to inside the docker container such that you can save and load notebooks.

Next you can open your browser and load the page [https://localhost:8888/?token=madx](https://localhost:8888/?token=madx) to connect to the running jupyter lab server.
