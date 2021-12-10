FROM jupyter/minimal-notebook:2021-11-20

RUN mkdir src
WORKDIR src/
COPY . .

RUN conda env update --file environment.yml --prune

WORKDIR notebooks

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
