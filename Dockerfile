# Use an official pytorch image as parent image
#FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel as  builder 

FROM ufoym/deepo


ADD requirements.txt .

#

RUN python -m pip install --upgrade pip &&\
	 python -m pip install --no-cache-dir -r ./requirements.txt\
	&& rm -rf /var/lib/apt/lists/* 

RUN mkdir ~/stockage

EXPOSE 5000
EXPOSE 8888

VOLUME /stockage
 
