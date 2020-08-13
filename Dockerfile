FROM tensorflow/tensorflow:2.3.0-gpu as base

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y --no-install-recommends \
        libsm6 \
        libxext6 \
        libxrender-dev \
        libfontconfig1 \
        git \
        unzip \
        wget \
        vim
    
RUN pip --no-cache-dir install --upgrade \
    pip \
    setuptools \
    opencv-python \
    is-msgs \
    is-wire

RUN pip --no-cache-dir install --upgrade protobuf

# Download and convert yolov3.weights
WORKDIR /home
RUN git clone https://github.com/zzh8829/yolov3-tf2.git
WORKDIR /yolov3-tf2
RUN wget https://pjreddie.com/media/files/yolov3.weights -O data/yolov3.weights
RUN python convert.py --weights ./data/yolov3.weights --output ./checkpoints/yolov3.tf

