FROM jupyter/minimal-notebook:2021-11-20

RUN mkdir src
WORKDIR src/
COPY . .

RUN pip install -r requirements.txt

WORKDIR notebooks

# avoid mixing output from C and Fortran code when using cpymad:
ENV GFORTRAN_UNBUFFERED_PRECONNECTED=y 

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
