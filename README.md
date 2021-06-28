# docker-toolbox
 
This is my personal "toolbox" used in docker / k8s environments.   
It contains some useful packages and can be run for have a ready to use console.

Packages included:
 - ruby 2.7
 - wget 
 - curl
 - htop 
 - nano 
 - tmux
 - zip/unzip
 - lbzip2 
 - bzip2 
 - tmux
 - PostgreSQL client (pg_dump) for versions 9.6 -> 12
 - MySQL client (mysqldump) for versions 5.7+
 - Clickhouse client for versions 19+

## Usage

```
docker run -d leen15/toolbox
docker exec -it leen15/toolbox bash
``` 