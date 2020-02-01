FROM anibali/pytorch:cuda-10.1
ADD requirements.txt .

RUN python -m pip install --upgrade pip &&\
         python -m pip install --no-cache-dir -r ./requirements.txt\
        && rm -rf /var/lib/apt/lists/*

RUN conda install -y nodejs opencv Cython jupyter jupyterlab && \
    conda install -c conda-forge tensorboardx && \
    conda install -c conda-forge librosa && \
    conda clean -ya

RUN jupyter labextension install jupyterlab_tensorboard

RUN pip install jupyter_tensorboard torchvision scikit-image

# tensorboard
EXPOSE 6006
# jupyter notebook
EXPOSE 8888

USER root

WORKDIR /home

RUN mkdir stockage

VOLUME stockage

