FROM quay.io/jupyter/minimal-notebook:2024-01-29

RUN mkdir src
WORKDIR src/
COPY . .

USER root
RUN chown -R 1000 .
USER jovyan

RUN pip install -r requirements.txt

WORKDIR notebooks

# avoid mixing output from C and Fortran code when using cpymad:
ENV GFORTRAN_UNBUFFERED_PRECONNECTED=y 

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
