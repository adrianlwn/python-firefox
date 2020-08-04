FROM selenium/standalone-firefox
USER root

# Python package management and basic dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl python3.7 python3.7-dev python3.7-distutils python3.7-pip

# Register the version in alternatives
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

# Set python 3 as the default python
RUN update-alternatives --set python /usr/bin/python3.7
RUN update-alternatives --set pip /usr/bin/pip3.7
