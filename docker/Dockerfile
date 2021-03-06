FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

MAINTAINER shaswot <shaswot@acsl.ics.keio.ac.jp>

# install system-wide deps for python and node
# The yqq flag is used to suppress output and assumes "Yes" to all prompts.

# https://github.com/NVIDIA/nvidia-docker/issues/1632
RUN apt-key del 7fa2af80
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/7fa2af80.pub
RUN apt-get -yqq update --fix-missing

RUN DEBIAN_FRONTEND='noninteractive' apt-get -yqq install \
        screen \
        vim \
        git \
        openssh-server \
        htop \
        wget \
	net-tools \	
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*


# set a directory for the program 
RUN mkdir -p /repos/wsn-morl

# copy files to the container
COPY . /repos/wsn-morl
COPY ./docker/requirements.txt /tmp/

# install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# folder to share files with host machine
RUN mkdir /stash
VOLUME stash

# define the port number the container should expose
# All running containers expose 8888
# They are redirected to other ports using docker -p <machine_port>:8888
EXPOSE 8888

# Change workdir to root so that Jupyter Lab can access the /stash folder
# /stash folder stores large dumpfiles that can be accessed from the host computer
WORKDIR /

# run bash shell
# start jupyter lab once inside the container using screen
# this allows you to access the bash shell and run multiple screens for multiple notebooks / tensorboards 
RUN /bin/bash
