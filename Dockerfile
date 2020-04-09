FROM anibali/pytorch:cuda-10.1
ADD requirements.txt .

RUN python -m pip install --upgrade pip &&\
         python -m pip install --no-cache-dir -r ./requirements.txt\
        && rm -rf /var/lib/apt/lists/*

RUN conda update -n base -c defaults conda

RUN conda install -y nodejs opencv Cython jupyter jupyterlab && \
    conda install -c conda-forge tensorboardx && \
    conda install -c conda-forge librosa && \
    conda clean -ya


RUN jupyter labextension install jupyterlab_tensorboard

RUN pip install jupyter_tensorboard torchvision scikit-image

RUN pip install git+https://github.com/beroguedou/SpecAugment.git

USER root

#RUN apt-get update && apt-get install -y gcc

# tensorboard
EXPOSE 6006
# jupyter notebook
EXPOSE 8888

RUN mkdir /home/stockage

WORKDIR /home/stockage

VOLUME /home/stockage

VOLUME /home


