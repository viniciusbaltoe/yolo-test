FROM tensorflow/tensorflow:2.3.0-gpu as base

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y --no-install-recommends \
        git \
        unzip \
        wget \
        vim
    
RUN pip --no-cache-dir install --upgrade \
    pip \
    is-msgs \
    is-wire

RUN pip --no-cache-dir install --upgrade protobuf

# Download and convert yolov3.weights
WORKDIR /home
RUN git clone https://github.com/viniciusbaltoe/yolo-test.git
WORKDIR /home/yolo-test
RUN pip install -r ./requirements.txt
RUN wget -P model_data https://pjreddie.com/media/files/yolov3.weights


