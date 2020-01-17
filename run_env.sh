#docker run --gpus all -d -p 8888:8888 --name notebook  env_pytorch_ber:1.0

container_name=$(docker run -d --gpus all -it -p 8888:8888 \
		-v /home/data:/root/stockage\
                --ipc=host env_pytorch_ber:1.0 jupyter notebook \
	            --no-browser --ip=0.0.0.0 --allow-root \
                --NotebookApp.token= --notebook-dir='/root')

docker rename $container_name notebook
