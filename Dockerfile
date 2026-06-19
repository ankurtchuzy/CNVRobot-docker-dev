############ Building instructions ############

# Command to build local image:             docker build -t cnv-robot:vX.X .
# Commands to build image and publish to Docker Hub
# Login from command line:                  docker login
# Build image:                              docker build -t user_name/cnv-robot-docker-dev:v4.2 .
# Push to Docker Hub:                       docker push user_name/cnv-robot-docker-dev:v4.2
# If the image was build with a different local name, tag it to the name in Docker Hub repo and push
# docker tag existing-local-name user_name/cnv-robot-docker-dev:v4.2
# docker push user_name/cnv-robot-docker-dev:v4.2

###############################################

# Getting an existing base image. Everything builds on top of this base image.
FROM mambaorg/micromamba:1.5.10-noble
# Copying dependencies file into the container
COPY --chown=$MAMBA_USER:$MAMBA_USER dependencies.yml /tmp/dependencies.yml
# Commands to build layers
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
# Doenload databases and extract them
RUN wget -q "https://zenodo.org/records/20761773/files/Databases.zip?download=1" \
    -O Databases.zip && \
    unzip Databases.zip && \
    rm Databases.zip
# Include metadata
LABEL   cnvrobot.version="4.2" \
        org.opencontainers.image.authors="amikulas@ed.ac.uk & ankur.chaurasia@ed.ac.uk"
