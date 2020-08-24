# yolo-test
Teste para a utilização do yolo

* BUILD DOCKERFILE

cd ~/yolo-test

docker build -t yolo-test:0.0.5

* RUN (CPU) with:

docker run -ti --privileged -dti --net=host --name yolo -v /tmp/.X11-unix:/tmp/.X11-unix --env="DISPLAY" -v /dev/:/dev/ -v /proc:/proc  --volume="$HOME/.Xauthority:/root/.Xauthority:rw" yolo-test:0.0.5

* RUN (GPU in IS) with:

docker run -ti --gpus 0 --name yolo yolo-test:0.0.5

(git pull)

Go 10.10.2.3:30300/Vinicius.Frame