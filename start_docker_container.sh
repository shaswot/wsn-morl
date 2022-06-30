# START DOCKER CONTAINER
docker run --gpus all \
        -dit \
        -v ~/stash:/stash \
        --name <container_name> \
        -p <host_machine_jupyter_lab_port>:8888 \
        -p <host_machine_tensorboard_port>:6006 \
	<image_name:tag> \
	screen -S jlab jupyter lab --no-browser --ip=0.0.0.0 --port 8888 --allow-root --LabApp.token=''
