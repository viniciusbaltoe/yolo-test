FROM ubuntu:latest

MAINTAINER viniciusbaltoe@gmail.com

RUN apt-get update && apt-get install -y vim 
RUN apt-get install -y git 
RUN apt-get install -y python3
RUN apt-get install -y python3-pip 
RUN apt-get install -y wget 
RUN apt-get clean

RUN git clone https://github.com/zzh8829/yolov3-tf2.git
WORKDIR yolov3-tf2

#RUN pip3 install -r requirements.txt
RUN pip3 install tensorflow
RUN pip3 install opencv-python
RUN pip3 install lxml
RUN pip3 install tqdm