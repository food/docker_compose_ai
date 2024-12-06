FROM nvidia/cuda:12.2.2-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y wget git python3 python3-venv libgl1 libglib2.0-0 pip
#Install TMalloc
RUN apt install -y libgoogle-perftools-dev
#Install required tools for automatic 1111
RUN apt install -y libgl1
RUN apt install -y libglib2.0-0 libsm6 libxrender1 libxext6
RUN apt install -y vim
RUN ln -sf $(which python3) /usr/bin/python

#Create new user
#ARG USERNAME=appuser
#ARG USER_UID=1000
#ARG USER_GID=1000

#RUN groupadd --gid $USER_GID $USERNAME \
#    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
    #&& echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    #&& chmod 0440 /etc/sudoers.d/$USERNAME

#WORKDIR /home/appuser
#USER appuser
#ENV HOME=/home/appuser
#ENV PATH="/home/appuser/.local/bin:$PATH"