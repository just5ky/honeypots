FROM python:3.10

RUN apt-get update -y 

RUN pip3 install honeypots

WORKDIR /honeypots

VOLUME /honeypots

COPY config.json .  

ENTRYPOINT ["python3","-m","honeypots","--config","config.json"]
