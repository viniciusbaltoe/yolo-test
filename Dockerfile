FROM ubuntu:latest

MAINTAINER viniciusbaltoe@gmail.com

RUN apt-get update && apt-get install -y vim \
    && apt-get install -y git \
    && apt-get install -y python3 \
    && apt-get install -y python3-pip \
    && apt-get install -y wget \
    && pip3 install opencv \
    && apt-get clean

RUN git clone https://github.com/pjreddie/darknet

RUN /bin/bash -c "cd darknet \
    && make"

RUN /bin/bash -c "cd darknet \
    && wget https://pjreddie.com/media/files/yolov3.weights"
