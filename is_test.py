from is_wire.core import Channel,Subscription,Message
from is_msgs.image_pb2 import Image
import cv2
import numpy as np

# funcao legado
def to_image(input_image, encode_format='.jpeg', compression_level=0.8):
    if isinstance(input_image, np.ndarray):
        if encode_format == '.jpeg':
            params = [cv2.IMWRITE_JPEG_QUALITY, int(compression_level * (100 - 0) + 0)]
        elif encode_format == '.png':
            params = [cv2.IMWRITE_PNG_COMPRESSION, int(compression_level * (9 - 0) + 0)]
        else:
            return Image()
        cimage = cv2.imencode(ext=encode_format, img=input_image, params=params)
        return Image(data=cimage[1].tobytes())
    elif isinstance(input_image, Image):
        return input_image
    else:
        return Image()

# 1
channel = Channel('amqp://10.10.2.7:30000')

#cap = cv2.VideoCapture(sys.argv[1])

while True:
    img   = "./IMAGES/kite.jpg"
    #camera_ok, img = cap.read()
    #if not camera_ok:
    #    print('Unable to read camera')
    #    break
    
    # 2
    img_message = Message()
    # 3
    img_message.pack(to_image(img))
    # 4
    channel.publish(img_message, 'Vinicius.1.Frame')
    print("##")
