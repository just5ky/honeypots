FROM python:latest

RUN echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections && \
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections && \
    apt-get update -y && apt-get install -y iptables-persistent tcpdump nmap iputils-ping libpq-dev python3-psycopg2 lsof psmisc dnsutils libffi-dev libssl-dev
RUN pip3 install honeypots

WORKDIR /honeypots

# COPY config.json .  | need to be provided by the user
# ARG PORTS
# EXPOSE ${PORTS}

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

# ENTRYPOINT ["python3","-m","honeypots","--config","config.json", "--setup", "all"]

# ENTRYPOINT ["python3","-m","honeypots","-h"]

ENTRYPOINT ["python3","-m","honeypots"]
