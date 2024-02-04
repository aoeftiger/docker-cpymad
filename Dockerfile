FROM quay.io/jupyter/minimal-notebook:2024-01-29

COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

COPY --chown=${NB_UID}:${NB_GID} notebooks/ ./
USER jovyan

# avoid mixing output from C and Fortran code when using cpymad:
ENV GFORTRAN_UNBUFFERED_PRECONNECTED=y 

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
