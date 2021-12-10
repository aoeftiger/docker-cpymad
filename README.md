# docker-cpymad
Beam Dynamics: repository with cpymad and MAD-X configuration for running jupyter notebooks *inside a docker container* e.g. on binder

## How to build the docker container
The docker container can be built locally by running on the command line

    docker build -t aoeftiger/docker-cpymad .

## How to run the docker container
The docker container can be run on the command line with a pre-specified jupyter token (here "madx") via

    JUPYTER_TOKEN=madx docker run -p 8888:8888 -e JUPYTER_TOKEN aoeftiger/docker-cpymad

Next you can open your browser and open the page [https://localhost:8888/?token=madx](https://localhost:8888/?token=madx) to connect to the running jupyter lab server.
