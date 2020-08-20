# yolo-test
Teste para a utilização do yolo

RUN with:

docker run -ti --gpus 0 --privileged -dti --net=host --name yolo -v /tmp/.X11-unix:/tmp/.X11-unix --env="DISPLAY" -v /dev/:/dev/ -v /proc:/proc  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" yolo-test:0.0.5