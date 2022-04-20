# Docker image of [qeeqbox/honeypots](https://github.com/qeeqbox/honeypots)

<p align="center"> <img src="https://raw.githubusercontent.com/qeeqbox/honeypots/main/readme/honeypots.png"></p>

25 low-high level honeypots in a single PyPI package for monitoring network traffic, bots activities, and username \ password credentials. 


<img src="https://raw.githubusercontent.com/qeeqbox/honeypots/main/readme/intro.gif" style="max-width:768px"/>

## Custom configure with logs location
` docker run -i --privileged honeypot --setup all --config config.json -p <as required> -v ~/honeypot:/var/log/honeypots/  `

### Exposed ports internally

`21, 8080, 80, 443, 143, 3306, 110, 5432, 6379, 445, 25, 1080, 22, 23, 5900, 9200, 1433, 389, 123, 11211, 1521, 161`


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

