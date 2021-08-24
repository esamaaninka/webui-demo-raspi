FROM ubuntu:latest

# Settings to avoid questions from user during apt update
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Helsinki

# Upgrade apt and install necessary packages via apt
RUN apt update && apt install -y \
    firefox \
    python3 \
    python3-pip

# Create profile for headless firefox to avoid issues launching the browser the first time
RUN firefox -CreateProfile "headless /moz-headless"  -headless

# Upgrade pip, install robot framework, libraries and other necessary packages via pip
RUN python3 -m pip install \
    --upgrade pip \
    robotframework \
    robotframework-seleniumlibrary \
    webdrivermanager

# Install firefox webdriver to a location found in PATH
RUN webdrivermanager firefox --linkpath /usr/local/bin

# Change work directory to the folder that will have the mounted files
WORKDIR /usr/src/project/

# Set the robot cmd to be always executed like it is written here, outputs will be created to results folder
ENTRYPOINT ["robot", "-d", "results"]

# CMD will be appended to ENTRYPOINT
# As default all files in the suites folder will be ran, but this can be overwritten in the docker run cmd
CMD ["suites"]
