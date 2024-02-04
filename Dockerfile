FROM quay.io/jupyter/minimal-notebook:2024-01-29

RUN mkdir src
WORKDIR src/
COPY Dockerfile  LICENSE  notebooks  README.md  requirements.txt ./

USER root
USE chown 1000 -R .

USER jovyan

RUN pip install -r requirements.txt --no-cache-dir

WORKDIR notebooks

# avoid mixing output from C and Fortran code when using cpymad:
ENV GFORTRAN_UNBUFFERED_PRECONNECTED=y 

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
