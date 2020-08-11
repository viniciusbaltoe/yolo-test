FROM ubuntu:latest

MAINTAINER viniciusbaltoe@gmail.com

RUN apt-get update && apt-get install -y vim \
    && apt-get install -y python3 \
    && apt-get install -y python3-pip \
    && pip3 install opencv-contrib-python \ #Este nao funciona na rasp.
    && apt-get clean


