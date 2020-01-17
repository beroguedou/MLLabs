# Use ufoym/deepo image as parent image

FROM ufoym/deepo

ADD requirements.txt .

# Install all libraries in requirements
RUN python -m pip install --upgrade pip &&\
	 python -m pip install --no-cache-dir -r ./requirements.txt\
	&& rm -rf /var/lib/apt/lists/* 
# Create a volume in container to expose to host
RUN mkdir ~/stockage

EXPOSE 5000
EXPOSE 8888

VOLUME /stockage
 
