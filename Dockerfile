FROM ubuntu:latest

MAINTAINER viniciusbaltoe@gmail.com

RUN apt-get update && apt-get install -y vim \
    && apt-get install -y python3 \
    && apt-get install -y python3-pip \
    && pip3 install opencv-contrib-python \ #Este nao funciona na rasp.
    && apt-get install -y wget
    && apt-get clean

RUN git clone https://github.com/pjreddie/darknet

RUN /bin/bash -c "cd darknet \
    && make"

RUN /bin/bash -c "wget https://pjreddie.com/media/files/yolov3.weights"
