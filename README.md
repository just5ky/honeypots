# Docker image of [qeeqbox/honeypots](https://github.com/qeeqbox/honeypots)

<p align="center"> <img src="https://raw.githubusercontent.com/qeeqbox/honeypots/main/readme/honeypots.png"></p>

25 low-high level honeypots in a single PyPI package for monitoring network traffic, bots activities, and username \ password credentials. 

Based on PyPi package [honeypots](https://pypi.org/project/honeypots/)

<img src="https://raw.githubusercontent.com/qeeqbox/honeypots/main/readme/intro.gif" style="max-width:768px"/>

---

Dockerhub repo link: [justsky/honeypots](https://hub.docker.com/r/justsky/honeypots)<br>
![Docker Build](https://github.com/just5ky/port-forward/workflows/Docker%20CI/badge.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/justsky/honeypots) ![Docker Size](https://img.shields.io/docker/image-size/justsky/honeypots?color=orange)
## docker run --rm justsky/honeypots -h
```sh
Qeeqbox/honeypots customizable honeypots for monitoring network traffic, bots activities, and username\password credentials

Arguments:
  --setup               target honeypot E.g. ssh or you can have multiple E.g ssh,http,https
  --list                list all available honeypots
  --kill                kill all honeypots
  --verbose             Print error msgs

Honeypots options:
  --ip                  Override the IP
  --port                Override the Port (Do not use on multiple!)
  --username            Override the username
  --password            Override the password
  --config              Use a config file for honeypots settings
  --options             Extra options (capture_commands for capturing all threat actor data)

General options:
  --termination-strategy {input,signal} Determines the strategy to terminate by
  --test                Test a honeypot
  --auto                Setup the honeypot with random port
```


## Custom configure with logs location
With Terminal output


` docker run -i -p 80:80 -v ~/honeypot_logs:/honeypots/logs justsky/honeypots --setup all`

Without Terminal output

` docker run -d -i -p 80:80 -v ~/honeypot_logs:/honeypots/logs justsky/honeypots --setup all`


Docker compose

```yml
version: '3.3'
services:
    honeypots:
        container_name: honeypots
        image: justsky/honeypots:latest   # latest, dev
        restart: unless-stopped
        command: --setup all
# Add your custom path to this folder
        volumes:
            - '~/honeypot_logs:/honeypots/logs'
# Dont change the internal ports, change only external            
        ports:
            - 21:21         # FTP
            - 22:22         # SSH
            - 23:23         # TELNET
            - 25:25         # SMTP
            - 80:80         # HTTP
            - 110:110       # POP3
            - 123:123       # NTP
            - 143:143       # IMAP
            - 161:161       # SNMP
            - 389:389       # LDAP
            - 443:443       # HTTPS
            - 445:445       # SMB
            - 1080:1080     # SOCKS5
            - 1433:1433     # MSSQL
            - 1521:1521     # ORACLE
            - 3306:3306     # MYSQL
            - 5432:5432     # POSTGRES
            - 5900:5900     # VNC
            - 6379:6379     # REDIS
            - 8080:8080     # HTTPPROXY
            - 9200:9200     # ELASTIC
            - 11211:11211   # MEMCACHE
```

### Exposed ports internally

`21, 22, 23, 25, 80, 110, 123, 143, 161, 389, 443, 445, 1080, 1433, 1521, 3306, 5432, 5900, 6379, 8080, 9200, 11211`


#### config.json (Output to folder)
```json
{
  "logs": "file,json",
  "logs_location": "/var/log/honeypots/",
  "syslog_address": "",
  "syslog_facility": 0,
  "postgres": "",
  "sqlite_file":"",
  "db_options": [],
  "sniffer_filter": "",
  "sniffer_interface": "",
  "honeypots": {
    "ftp": {
      "port": 21,
      "ip": "0.0.0.0",
      "username": "ftp",
      "password": "anonymous",
      "log_file_name": "ftp.log",
      "max_bytes": 10000,
      "backup_count": 10
    }
  }
}
```

## All output values
```sh
'error'     :'Information about current error' 
'server'    :'Server name'
'timestamp' :'Time in ISO'
'action'    :'Query, login, etc..'
'data'      :'More info about the action'
'status'    :'The return status of the action (success or fail)'
'dest_ip'   :'Server address'
'dest_port' :'Server port'
'src_ip'    :'Attacker address'
'src_port'  :'Attacker port'
'username'  :'Attacker username'
'password'  :'Attacker password'
```

### Things to add
- Docker compose
- OpenSearch integration
