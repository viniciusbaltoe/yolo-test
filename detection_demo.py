
import os
os.environ['CUDA_VISIBLE_DEVICES'] = '1'
import cv2
import numpy as np
import tensorflow as tf
from yolov3.yolov4 import Create_Yolo
from yolov3.utils import load_yolo_weights, detect_image, detect_video, detect_realtime
from yolov3.configs import *


if YOLO_TYPE == "yolov4":
    Darknet_weights = YOLO_V4_TINY_WEIGHTS if TRAIN_YOLO_TINY else YOLO_V4_WEIGHTS
if YOLO_TYPE == "yolov3":
    Darknet_weights = YOLO_V3_TINY_WEIGHTS if TRAIN_YOLO_TINY else YOLO_V3_WEIGHTS

#image_path   = "./IMAGES/carros.jpeg"
#video_path   = "./IMAGES/test.mp4"
#usbcam_path  = cv2.VideoCapture(0)

yolo = Create_Yolo(input_size=YOLO_INPUT_SIZE)
load_yolo_weights(yolo, Darknet_weights) # use Darknet weights

detect_image(yolo, image_path, "./IMAGES/carros.jpeg", input_size=YOLO_INPUT_SIZE, show=True, rectangle_colors=(255,0,0))
#detect_video(yolo, video_path, '', input_size=YOLO_INPUT_SIZE, show=True, rectangle_colors=(255,0,0))
#detect_realtime(yolo, usbcam_path, input_size=YOLO_INPUT_SIZE, show=True, rectangle_colors=(255, 0, 0))
