FROM selenium/standalone-firefox
USER root

# Python package management and basic dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl python3.7 python3.7-dev python3.7-distutils

# Register the version in alternatives
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

# Set python 3 as the default python
RUN update-alternatives --set python /usr/bin/python3.7