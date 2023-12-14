FROM ubuntu:22.04

ARG USERNAME=jenkins
ARG GROUPNAME=jenkins

# UID and GID are intended to be overwritten by --build-arg option of "docker build" command.
ARG UID=1000 
ARG GID=1000

RUN apt update
RUN apt install -y sudo zip

RUN groupadd -g $GID $GROUPNAME
RUN useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/
