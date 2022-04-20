FROM python:latest

RUN apt-get update -y 

RUN apt-get install -y setuptools

RUN apt install -y tcpdump iputils-ping libpq-dev python3-psycopg2 lsof psmisc dnsutils libffi-dev libssl-dev

RUN pip3 install honeypots

WORKDIR /honeypots

EXPOSE 21
EXPOSE 8080
EXPOSE 80
EXPOSE 443
EXPOSE 143
EXPOSE 3306
EXPOSE 110
EXPOSE 5432
EXPOSE 6379
EXPOSE 445
EXPOSE 25
EXPOSE 1080
EXPOSE 22
EXPOSE 23
EXPOSE 5900
EXPOSE 9200
EXPOSE 1433
EXPOSE 389
EXPOSE 123
EXPOSE 11211
EXPOSE 1521
EXPOSE 161

ENTRYPOINT ["python3","-m","honeypots"]
