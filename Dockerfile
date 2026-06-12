FROM mambaorg/micromamba:1.5.10-noble
COPY --chown=$MAMBA_USER:$MAMBA_USER dependencies.yml /tmp/dependencies.yml
RUN micromamba install -y -n base -f /tmp/dependencies.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba env export --name base --explicit > environment.lock \
    && echo ">> CONDA_LOCK_START" \
    && cat environment.lock \
    && echo "<< CONDA_LOCK_END" \
    && micromamba clean -a -y
USER root
ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"
RUN R -e "install.packages('splitstackshape', dependencies=TRUE, repos='https://cloud.r-project.org')"
WORKDIR /home/mambauser
RUN git clone https://github.com/AnetaMikulasova/CNVRobot.git \
    && find CNVRobot/Scripts -name "*.sh" -exec chmod +x {} \;